require 'rails_helper'

describe Contact do
  let(:vcard) { File.read(Rails.root + "lib/assets/vcard.vcf") }
  describe ".card" do
    it "returns a vcard" do
      expect(described_class.card).to be_a(VCardigan::VCard)
      expect(described_class.card.to_s).to eq(vcard)
    end
  end
end
