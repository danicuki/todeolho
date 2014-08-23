namespace :importer do
  task politicians: :environment  do
    url = "https://api.transparencia.org.br/api/v1/excelencias?casa=1"


    c = Curl::Easy.perform(url) do |http|
      http.headers['App-Token'] = 'Ki4auuKrA5wR'
      http.ssl_verify_peer = false
    end
    politicians = JSON.parse(c.body_str, symbolize_names: true)
    politicians.each do |politician|
      Politician.create! name: politician[:apelido], api_id: politician[:id]
    end
  end
end
