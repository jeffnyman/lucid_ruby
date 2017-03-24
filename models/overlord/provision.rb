class Provision
  include Tapestry

  element :activation_code,   id: "activation-code"
  element :deactivation_code, id: "deactivation-code"
  element :countdown_value,   id: "countdown-value"
  element :provision_bomb,    id: "provision-bomb"
  element :provision_error,   id: "provision-error"

  def create_bomb(options = {})
    activation_code.set(options[:activate])     if options[:activate]
    deactivation_code.set(options[:deactivate]) if options[:deactivate]
    countdown_value.set(options[:countdown])    if options[:countdown]
    provision_bomb.click
  end
end
