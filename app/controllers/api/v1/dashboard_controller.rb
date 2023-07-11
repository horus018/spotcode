class Api::V1::DashboardController < ApplicationController
    def index
        load_recent_heard
        load_recomendations
    end
    #Lucas, da pra testar no rails console, essas operações abaixo na qual as variaveis de instancia recebem
    #Lucas, dois pontos(: colom) antes do nome da variavel é simbolo, dois pontos depois, é hash
    def load_recent_heard
        #o current_user é uma variavel do devise token auth, usuario atual q esta logado!
        @recent_albums = current_user.recently_heards.order('created_at DESC').limit(4).map(&:album)
        #se a herd_categories existe, ou seja, se a tabela recently_heards esta populada, quer dizer que
        #o current_user possui albuns que ele ouviu recentemente, pois vou adicionar albums q ouvi nessa tabela 
        # do recently_heards, sacou?
    end

    def load_recomendations
        heard_categories = @recent_albums.map(&:category)#o .map aqui serve pra pegar relações entre tabelas de forma facil
        # tipo voce pega aqui os albuns ouvidos recentemente, mas eu quero as categorias desses albuns
        # pra nao usar o join ou outra relacao com chave estrangeira, o .map retorna tudo isso dentro de um array facinho
    if heard_categories.present?
        @recomend_albums = Album.joins(:category, :songs).where(category: heard_categories).order('songs.played_count').select('distinct albums.*').limit(12)
    else                                                 
        @recomend_albums = Album.all.sample(12)
    end


    end
end
