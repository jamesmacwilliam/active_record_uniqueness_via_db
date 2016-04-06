class ActiveRecordUniquenessViaDb::Adapters::Postgresql
  def error_matches_attr(attr, err_msg)
    err_msg =~ /PG[:]*UniqueViolation[^(]*[(]#{attr}[)].*/
  end
end
