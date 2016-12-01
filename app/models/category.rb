class Category < ActiveRecord::Base

	has_many :pages
	has_many :comments, as: :commentable

	scope :visible, lambda{where(:visible => true)}
	scope :invisible, lambda{where(:visible => false)}
	scope :sort, lambda{order("categories.position ASC")}
	scope :newest, lambda{order("categories.created_at DESC")}

end
