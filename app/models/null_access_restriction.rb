class NullAccessRestriction < AccessRestriction
  def to_all
    false
  end

  def to_members_only
    false
  end
end
