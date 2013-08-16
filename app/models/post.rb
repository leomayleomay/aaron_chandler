class Post < ActiveRecord::Base
  attr_accessible :body, :title, :access_restriction_attributes

  validates_presence_of :body, :title

  has_one :access_restriction, :dependent => :destroy
  accepts_nested_attributes_for :access_restriction

  def is_visible_to_member?
    access_restriction.to_members_only?
  end

  def is_visible_to_all?
    access_restriction.to_all?
  end

  def access_restriction
    super || NullAccessRestriction.new
  end
end
