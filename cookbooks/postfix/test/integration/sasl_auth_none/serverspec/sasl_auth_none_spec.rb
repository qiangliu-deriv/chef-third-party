# Copyright:: 2012-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require_relative './spec_helper'

describe 'postfix::sasl_auth' do
  let(:sasl_passwd_file) { '/etc/postfix/sasl_passwd' }

  it 'manages postfix sasl_passwd' do
    expect(file(sasl_passwd_file).content).to match(/^# Auto-generated by Chef/)
  end

  it 'configures postfix to use the sasl_passwd file' do
    expect(file('/etc/postfix/main.cf').content).to match(/^\s*smtp_sasl_password_maps\s*=.*#{sasl_passwd_file}\s*$/)
  end

  it 'configures postfix sasl_passwd with nothing in it' do
    expect(file(sasl_passwd_file).content).to match(/^# This file is generated by Chef for .*\n/)
  end
end
