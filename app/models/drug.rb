class Drug < ActiveRecord::Base

	validates :condition, presence: true, uniqueness: true
  validates :subcategory, presence: true, uniqueness: true
  validates :drug, presence: true, uniqueness: true

  def self.search(query)
    where("condition like ? or subcategory like ? or drug like ?", "%#{query}%", "%#{query}%", "%#{query}%")

   
   
    
    
  end

  

end