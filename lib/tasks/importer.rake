namespace :importer do
  task politicians: :environment  do
    url = "https://api.transparencia.org.br/api/v1"
    params = {casa: "1"}

    politicians_request = Curl.get(url+"/excelencias", params) do |http|
      http.headers['App-Token'] = 'Ki4auuKrA5wR'
      http.ssl_verify_peer = false
      http.verbose = true
    end

    politicians = JSON.parse(politicians_request.body_str, symbolize_names: true)
    politicians.each do |politician|
      p = Politician.where(api_id: politician[:id]).first || Politician.new(api_id: politician[:id])

      p.name = politician[:nome]
      p.nickname = politician[:apelido]
      p.party = politician[:partido]
      p.job_title = politician[:cargos]
      p.age = ""
      p.cpf = politician[:CPF]
      p.bio = politician[:miniBio]

      begin
      uri = I18n.transliterate(politician[:apelido].downcase.gsub(" ",""))
      more_info_url = "http://camarabook-api.herokuapp.com/v1/parliamentarians/"+uri
      more_info = JSON.parse(Curl.get(more_info_url).body_str)

      p.image = more_info["parliamentarian"]["image"]
      rescue
        puts    politician[:apelido]
      end

      p.save!
    end
  end
end
