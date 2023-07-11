class Api::V1::RecentlyHeardsController < ApplicationController
    def create
        current_user.recently_heards.create(album_id: params[:album_id])
        head :ok
        #aqui se voce buscar a url desse cara, vai dar erro com get, mas com post funciona, esta tudo certo por aq
    end
end
