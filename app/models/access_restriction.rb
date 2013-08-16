class AccessRestriction < ActiveRecord::Base
  attr_accessible :post_id, :to_all, :to_members_only

  belongs_to :post

  before_save :ensure_integrity

  protected
  def ensure_integrity
    if self.to_all?
      self.to_members_only = true
    end

    true
  end
end
