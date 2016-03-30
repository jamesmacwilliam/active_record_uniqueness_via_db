class ActiveRecordUniquenessViaDb::Adapters::Mysql2
  def error_matches_attr(attr, err_msg)
    err_msg =~ /Mysql2[:]*Error.*Duplicate entry.*for key ['][a-z0-9_]*#{attr}[']/
  end
end
