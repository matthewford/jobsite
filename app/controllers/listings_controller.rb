class ListingsController < InheritedResources::Base

  before_filter :authenticate_user!, :except => :search
  
  def search
    criteria = Listing.criteria
    
    unless params[:q].blank?
      criteria = criteria.where(:title => /#{params[:q]}/i)
    end

    scores = params.select{|k,v| k.split('_')[1] == 'score'}   
    scores.each{ |k,v| 
      criteria = criteria.where(:"#{k}".gte =>  v.to_i)
    }
    
    listings = criteria.desc(:created_at)
    
    render :json => listings, :content_type => 'application/json'
  end

  protected
  def begin_of_association_chain
    @current_user
  end
  
  def collection
    @listings ||= end_of_association_chain.desc(:created_at)
  end
end
