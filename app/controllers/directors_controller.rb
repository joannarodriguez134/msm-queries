class DirectorsController < ApplicationController

  def index
    render(template: "director_templates/list")
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.first

    
    render(template: "director_templates/details")
  end

  def show_youngest

    matching_records = Director.where.not({ :dob => nil }).all.order({ :dob => :asc })

    the_director = matching_records.last

    @director_name = the_director.name

    @director_dob = the_director.dob.strftime('%B %e, %Y')

    
    render(template: "director_templates/youngest_result")

  end


  def show_eldest

    matching_records = Director.where.not({ :dob => nil }).all.order({ :dob => :asc })

    the_director = matching_records.first

    @director_name = the_director.name

    @director_dob = the_director.dob.strftime('%B %e, %Y')

    
    render(template: "director_templates/eldest_result")

  end
  
end
