# frozen_string_literal: true

module Validate
  def valid?(re_statement, data_to_check, msg)
    raise puts msg unless data_to_check.match(re_statement)

    true
  end
end
