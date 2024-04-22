class CpfValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless valid_cpf?(value)
            record.errors.add(attribute, (options[:message] || "CPF não é válido"))
        end
    end
  
    def valid_cpf?(cpf)
      cpf.to_s.gsub(/[^\d]/, '').length == 11
    end
end