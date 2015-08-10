require_relative "spec_helper"

describe SockDrawer do
  let(:socks) { [left_white_sock, left_black_sock, left_red_sock, right_white_sock] }
  let(:left_white_sock)  { Sock.new(brand: "Nike", style: "quarter", color: "white") }
  let(:right_white_sock) { Sock.new(brand: "Nike", style: "quarter", color: "white") }
  let(:left_red_sock)    { Sock.new(brand: "Nike", style: "quarter", color: "red") }
  let(:left_black_sock)    { Sock.new(brand: "Nike", style: "quarter", color: "black") }

  let(:matcher) { SockMatcher.new }

  let(:drawer) { SockDrawer.new(socks: socks, matcher: matcher) }


  it "has socks" do
    expect(drawer.socks).to match_array socks
  end

  it "has a matcher" do
    expect(drawer.matcher).to eq matcher
  end

  describe "#supply_match_for", { supply_match_for: true } do
    let(:right_red_sock) { Sock.new(brand: "Nike", style: "quarter", color: "red") }

    context "when it has a matching sock" do
      it "returns a matching sock" do
        expect(drawer.supply_match_for right_red_sock).to match_array left_red_sock
      end

      it "removes the matching sock from its collection of socks" do
        drawer.supply_match_for(right_red_sock)
        expect(drawer.socks).to_not include left_red_sock
      end
    end

    context "when it has no matching socks" do
      it "returns nothing" do
        left_yellow_sock = Sock.new(brand: "Nike", style: "quarter", color: "yellow")

        expect(drawer.supply_match_for left_yellow_sock).to be_nil
      end
    end
  end

  describe "#supply_random_pair_of_socks", { supply_random_pair_of_socks: true } do
    context "when it has one or more pairs of matching socks" do
      it "returns one of its pairs of socks" do
        expect(drawer.supply_random_pair_of_socks).to eq [left_white_sock, right_white_sock]
      end

      it "removes paired socks from its collection of socks" do
        drawer.supply_random_pair_of_socks

        [left_white_sock, right_white_sock].each do |paired_sock|
          expect(drawer.socks).to_not include paired_sock
        end
      end
    end

    context "when it has no pairs of matching socks" do
      it "returns a collection with no socks" do
        non_matching_socks = [left_white_sock, left_red_sock]
        drawer_with_no_matching_socks = SockDrawer.new(socks: non_matching_socks, matcher: matcher)

        expect(drawer_with_no_matching_socks.supply_random_pair_of_socks).to be_empty
      end
    end
  end
end
