namespace :importer do
  task politicians: :environment  do
    url = "https://api.transparencia.org.br/api/v1"
    params = {casa: "1"}
    states = ["SP"]
    candidates = []

    states.each do |state|
      candidates_request = Curl.get(url+"/candidatos", params.merge(estado: state, cargo: "6")) do |http|
        http.headers['App-Token'] = 'Ki4auuKrA5wR'
        http.ssl_verify_peer = false
        http.verbose = true
      end

      candidates += JSON.parse(candidates_request.body_str, symbolize_names: true)
    end

    politicians_request = Curl.get(url+"/excelencias", params) do |http|
      http.headers['App-Token'] = 'Ki4auuKrA5wR'
      http.ssl_verify_peer = false
      http.verbose = true
    end


    politicians = JSON.parse(politicians_request.body_str, symbolize_names: true)
    politicians.each do |politician|
      p = Politician.where(api_id: politician[:id]).first || Politician.new(api_id: politician[:id])

      candidate = candidates.select{|c| c[:CPF] == politician[:CPF] }.first

      if candidate
        p.image = candidate[:foto]
        p.candidate_number = candidate[:numero]
        p.candidate_title = candidate[:titulo]
      end

      p.name = politician[:nome]
      p.nickname = politician[:apelido]
      p.party = politician[:partido]
      p.job_title = politician[:cargos]
      p.age = politician[:apelido]
      p.cpf = politician[:CPF]
      p.bio = politician[:miniBio]

      p.save!
    end
  end
end
