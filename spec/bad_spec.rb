require '../quadratic_equation.rb'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe QuadraticEquation do
  subject(:solution) { described_class.new(a: a, b: b, c: c).solve }

  describe 'how to solve an equation' do
    context 'when the equation has real roots' do
      let(:a) { 1 }
      let(:b) { -5 }
      let(:c) { 6 }

      it { is_expected.to contain_exactly 2, 3 }
    end

    context 'when the determinant is negative' do
      let(:a) { 1 }
      let(:b) { 1 }
      let(:c) { 2 }

      it { expect { solution }.to raise_exception }
    end

    context 'when the roots are equal' do
      let(:a) { 1 }
      let(:b) { -4 }
      let(:c) { 4 }

      it { expect(solution.first).to eql 2 }
    end
  end

  describe 'how to validate the equation' do
    context 'when the determinant is negative' do
      let(:equation) { described_class.new(b: 1, c: 2) }

      it { expect(equation).not_to be_valid }
    end
  end
end
