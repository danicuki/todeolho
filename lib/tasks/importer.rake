namespace :importer do
  task politicians: :environment  do

    TransparenciaBrasil.configure do |c|
      c.token = "Ki4auuKrA5wR"
    end

    politicians= TransparenciaBrasil::Excelencia.all(1)

    politicians.each do |politician|
      p = Politician.where(api_id: politician.id).first || Politician.new(api_id: politician.id)

      p.name = politician.nome
      p.nickname = politician.apelido
      p.party = politician.partido
      p.job_title = politician.cargos
      p.cpf = politician.CPF
      p.bio = politician.miniBio
      p.house = politician.casa
      p.state = politician.estado
      p.title = politician.titulo
      p.past_jobs = politician.cargosPassados
      p.past_parties = politician.partidosPassados

      begin
        uri = I18n.transliterate(politician.apelido).downcase.gsub(/\W/, "")
        more_info_url = "http://camarabook-api.herokuapp.com/v1/parliamentarians/"+uri
        more_info = JSON.parse(Curl.get(more_info_url).body_str)

        p.image = more_info["parliamentarian"]["image"]
      rescue
        puts $!
        puts politician.apelido
      end

      p.save!
    end
  end
end
