require '../quadratic_equation.rb'

RSpec.describe QuadraticEquation do
  subject(:solution) { described_class.new(a: a, b: b, c: c).solve }

  describe 'how to solve an equation' do
    context 'when the equation has real roots' do
      let(:a) { 1 }
      let(:b) { -7 }
      let(:c) { 10 }

      it { is_expected.to contain_exactly 2, 5 }
    end

    context 'when the determinant is negative' do
      let(:a) { 1 }
      let(:b) { 1 }
      let(:c) { 2 }

      it { expect { solution }.to raise_exception(QuadraticEquation::NoRootsException) }
    end

    context 'when the roots are equal' do
      let(:a) { 1 }
      let(:b) { -4 }
      let(:c) { 4 }

      it { is_expected.to contain_exactly 2 }
    end
  end

  describe 'how to validate the equation' do
    context 'when the determinant is negative' do
      let(:equation) { described_class.new(a: 1, b: 5, c: 2) }

      it { expect { equation.b = 1 }.to change { equation.valid? }.from(true).to(false) }
    end
  end
end
