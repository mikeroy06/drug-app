class Drug < ActiveRecord::Base

	

 

  def self.search(query)
    where("condition like ? or subcategory like ? or drug like ?", "%#{query}%", "%#{query}%", "%#{query}%")

   
   
    
    
  end

  
  

end