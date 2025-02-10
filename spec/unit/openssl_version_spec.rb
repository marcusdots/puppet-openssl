# frozen_string_literal: true

require 'spec_helper'
require 'facter'

describe Facter.fact(:openssl_version) do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      before do
        Facter.clear
      end

      describe 'openssl_version' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 0.9.8zg 14 July 2015')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('0.9.8zg')
          }
        end

        context 'with broken openssl' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').
              and_return('openssl: /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0: version `OPENSSL_1.0.1s\' not found (required by openssl)')
          end

          it {
            expect(Facter.value(:openssl_version)).to be_nil
          }
        end
      end

      describe 'openssl_version rhel' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.0.1e-fips 11 Feb 2013')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.0.1e')
          }
        end
      end

      describe 'openssl_version centos' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.0.2g  1 Mar 2016')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.0.2g')
          }
        end
      end

      describe 'openssl_version rhel8' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.1.1c FIPS  28 May 2019')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.1.1c')
          }
        end
      end

      describe 'openssl_version rhel8 latest' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.1.1k  FIPS 25 Mar 2021')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.1.1k')
          }
        end
      end

      describe 'openssl_version oracle7' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.0.2k-fips  26 Jan 2017')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.0.2k')
          }
        end
      end

      describe 'openssl_version oracle8' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.1.1k  FIPS 25 Mar 2021')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.1.1k')
          }
        end
      end

      describe 'openssl_version debian11' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 1.1.1w  11 Sep 2023')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('1.1.1w')
          }
        end
      end

      describe 'openssl_version debian12' do
        context 'with value' do
          before do
            allow(Facter::Util::Resolution).to receive(:which).with('openssl').and_return(true)
            allow(Facter::Util::Resolution).to receive(:exec).with('openssl version 2>&1').and_return('OpenSSL 3.0.15 3 Sep 2024 (Library: OpenSSL 3.0.15 3 Sep 2024)')
          end

          it {
            expect(Facter.value(:openssl_version)).to eq('3.0.15')
          }
        end
      end
    end
  end
end
