json.recent_albums @recent_albums.each do |album|
    json.id album.id
    json.title album.title
    json.artis_name album.artist.name
    json.cover_urs url_for(album.cover) 
    #esse url_for() é do active storage, ele pega o objeto storage entre parenteses
    #ou seja, quando vc criou o campo cover_url dessa tabela album com o active storage(no inicio do projeto)
    #voce pode acessar essa url com esse metodo
end

#aqui no jbuilder, eu trasformo os dados vindos do controller como formato json com 
#chave valor, tipo: {id: album.id} no json usa esse formato

json.recent_albums @recent_albums.each do |album|
    json.id album.id
    json.title album.title
    json.artis_name album.artist.name
    json.cover_urs url_for(album.cover) 
    #esse url_for() é do active storage, ele pega o objeto storage entre parenteses
    #ou seja, quando vc criou o campo cover_url dessa tabela album com o active storage(no inicio do projeto)
    #voce pode acessar essa url com esse metodo
end
