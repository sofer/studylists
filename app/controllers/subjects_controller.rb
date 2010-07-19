class SubjectsController < InheritedResources::Base

  def index
    @subjects = Subject.all
    respond_to do |format|
      format.html
      format.json  { render :json => @subjects }
    end
  end

end
