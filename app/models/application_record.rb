class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def diff?(other)

  end
end
