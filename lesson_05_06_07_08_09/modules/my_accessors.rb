# frozen_string_literal: true

# Написать модуль Acessors, содержащий следующие методы, которые можно вызывать на уровне класса: метод
# attr_accessor_with_history
# Этот метод динамически создает геттеры и сеттеры для любого кол-ва атрибутов, при этом сеттер сохраняет все значения
# инстанс-переменной при изменении этого значения.
# Также в класс, в который подключается модуль должен добавляться инстанс-метод
# <имя_атрибута>_history
# который возвращает массив всех значений данной переменной.
#
# метод
# strong_attr_acessor
# который принимает имя атрибута и его класс. При этом создается геттер и сеттер для одноименной инстанс-переменной, но
# сеттер проверяет тип присваемоего значения. Если тип отличается от того, который указан вторым параметром,
# то выбрасывается исключение. Если тип совпадает, то значение присваивается.

module Accessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      var_arg = "@#{arg}".to_sym
      history_arg = "@#{arg}_history"
      define_method(arg) { instance_variable_get(var_arg) } # getter
      define_method("#{arg}_history") { instance_variable_get(history_arg) } # getter for history
      define_method("#{arg}=".to_sym) do |value| # setter for history and var
        instance_variable_set(history_arg, [instance_variable_get(var_arg)]) if instance_variable_get(history_arg).nil?
        instance_variable_get(history_arg).push(instance_variable_set(var_arg, value))
      end
    end
  end

  def strong_attr_accessor(**attr)
    attr_var = "@#{attr}"
    define_method(attr) { instance_variable_get(attr_var) } # getter for attr
    define_method("#{attr}=".to_sym) do |value| # setter with type check
      raise TypeError unless value.is_a?(type)

      instance_variable_set(attr_var, value)
    end
  end
end
