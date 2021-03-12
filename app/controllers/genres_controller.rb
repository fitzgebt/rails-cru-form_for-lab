class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def new
        @genre = Genre.new
    end

    def create 
        @genre = Genre.create(strong_param(:name))
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(strong_param(:name))
        redirect_to genre_path(@genre)
    end

    private
    def strong_param(*args)
        params.require(:genre).permit(*args)
    end
end
