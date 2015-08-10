require_relative "spec_helper"

describe Canteen do
  let(:canteen) { Canteen.new(capacity: 1.5, material: "polycarbonate") }

  it "has a capacity" do
    expect(canteen.capacity).to eq 1.5
  end

  it "has a material" do
    expect(canteen.material).to eq "polycarbonate"
  end

  describe "reservations" do
    it "reports whether or not its reserved" do
      expect(canteen).to_not be_reserved
    end

    it "can be reserved" do
      canteen.reserve
      expect(canteen).to be_reserved
    end

    it "reports whether or not its available" do
      expect(canteen).to be_available
    end

    it "can become available" do
      canteen.reserve
      expect(canteen).to_not be_available

      canteen.end_reservation
      expect(canteen).to be_available
    end
  end

  describe "maintenance" do
    it "reports whether or not its damaged" do
      expect(canteen).to_not be_damaged
    end

    it "can be damaged" do
      canteen.record_damage
      expect(canteen).to be_damaged
    end

    it "can be repaired" do
      canteen.record_damage
      expect(canteen).to be_damaged

      canteen.repair
      expect(canteen).to_not be_damaged
    end
  end
end
