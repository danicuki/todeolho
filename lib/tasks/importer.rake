namespace :importer do
  task politicians: :environment  do
    url = "https://api.transparencia.org.br/api/v1"

    politicians_request = Curl.get(url+"/excelencias?casa=1") do |http|
      http.headers['App-Token'] = 'Ki4auuKrA5wR'
      http.ssl_verify_peer = false
    end

    # candidates_request = Curl.get(url+"/candidatos?casa=1", &request_setup)

    politicians = JSON.parse(politicians_request.body_str, symbolize_names: true)
    politicians.each do |politician|
      p = Politician.where(api_id: politician[:id]).first || Politician.new(api_id: politician[:id])
      p.name = politician[:nome]
      p.image = politician[:apelido]
      p.nickname = politician[:apelido]
      p.party = politician[:partido]
      p.job_title = politician[:cargos]
      p.candidate_number = politician[:apelido]
      p.candidate_title = politician[:apelido]
      p.age = politician[:apelido]
      p.cpf = politician[:CPF]
      p.bio = politician[:miniBio]

      p.save!
    end
  end
end
