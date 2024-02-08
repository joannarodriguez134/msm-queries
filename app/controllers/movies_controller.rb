class MoviesController < ApplicationController

  def index
    render({ template: "movies_templates/list"})
  end

  def show

    the_id = params.fetch("id")

    matching_records = Movie.where({ :id => the_id })

    @the_movie= matching_records.first
    render({ template: "movies_templates/details"})
  end


end
