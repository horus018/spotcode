class Category < ApplicationRecord
    has_many :albums
    validates :name, presence: true
    has_one_attached :image

    def artists
        Artist.joins(:albums).where(albums: {id: self.albums.ids }).distinct
    end

    def songs   
        Song.joins(:album).where(songs: {id: self.albums.ids }).distinct   
    end
end

#quero pegar os artistas que possuem albuns 
#com o category_id igual ao id da categoria que eu busco na pesquisa

#quero buscar as musicas na qual o album delas tenha o category_id igual
#ao id da categoria que eu busco na pesquisa

#.distinc é pra não trazer itens repetidos