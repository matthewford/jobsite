class ListingsController < InheritedResources::Base

  before_filter :authenticate_user!, :except => :search
  
  def search
    if params[:q].blank?
    @listings = Listing.all.desc(:created_at)
    else
    @listings = Listing.where(:title => /#{params[:q]}/i).desc(:created_at)
    end
    render :json => @listings, :content_type => 'application/json'
  end

  protected
  def begin_of_association_chain
    @current_user
  end
  
  def collection
    @listings ||= end_of_association_chain.desc(:created_at)
  end
end
