class DataSet < ActiveRecord::Base
  attr_accessible :name, :parent_id, :url
  acts_as_nested_set
  
  def max_level
    max = 0
    self.descendants.each do |node|
      if max < node.level
        max = node.level
      end
    end
    max
  end
  
end
