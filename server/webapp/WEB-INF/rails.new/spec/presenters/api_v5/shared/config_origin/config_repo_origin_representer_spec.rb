##########################################################################
# Copyright 2017 ThoughtWorks, Inc.
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
##########################################################################

require 'rails_helper'

describe ApiV5::Shared::ConfigOrigin::ConfigRepoOriginRepresenter do
  it 'should render remote config origin' do
    git_material = GitMaterialConfig.new('https://github.com/config-repos/repo', 'master')
    config_repo = RepoConfigOrigin.new(ConfigRepoConfig.new(git_material, 'json-plugin', 'repo1'), 'revision1')
    actual_json = ApiV5::Shared::ConfigOrigin::ConfigRepoOriginRepresenter.new(config_repo).to_hash(url_builder: UrlBuilder.new)

    expect(actual_json).to eq(expected_json)
  end

  def expected_json
    {
      type: 'config_repo',
      _links: {
        self: {
          href: 'http://test.host/api/admin/config_repos/repo1'
        },
        doc: {
          href: 'https://api.gocd.org/#config-repos'
        },
        find: {
          href: 'http://test.host/api/admin/config_repos/:id'
        }
      },
      id: 'repo1'
    }
  end
end
