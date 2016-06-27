class PartnerPortalDialog
  include PageObject
  attr_reader :code

  text_field :partner_code, :id => "partner_code_code"
  button :save_partner_code, :id => "partner_code_save"

  def input_partner_code
    self.partner_code = code
  end

  def code
    return generate_partner_code
  end

  def generate_partner_code
    return generate_code(3) + (rand 100..999).to_s
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
end
