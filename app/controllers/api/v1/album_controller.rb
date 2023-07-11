class Api::V1::AlbumController < ApplicationController
    def show
        @album = Album.find(params[:id])
    end
end
