///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 12:05
///
// ignore_for_file: non_constant_identifier_names
part of 'data_model.dart';

class Repository extends DataModel {
  const Repository({
    this.id,
    this.private,
    this.archive_url,
    this.archived,
    this.assignees_url,
    this.blobs_url,
    this.branches_url,
    this.clone_url,
    this.collaborators_url,
    this.comments_url,
    this.commits_url,
    this.compare_url,
    this.contents_url,
    this.contributors_url,
    this.created_at,
    this.default_branch,
    this.deployments_url,
    this.description,
    this.disabled,
    this.downloads_url,
    this.events_url,
    this.fork,
    this.forks,
    this.forks_count,
    this.forks_url,
    this.full_name,
    this.git_commits_url,
    this.git_refs_url,
    this.git_tags_url,
    this.git_url,
    this.has_downloads,
    this.has_issues,
    this.has_pages,
    this.has_projects,
    this.has_wiki,
    this.homepage,
    this.hooks_url,
    this.html_url,
    this.issue_comment_url,
    this.issue_events_url,
    this.issues_url,
    this.keys_url,
    this.labels_url,
    this.language,
    this.languages_url,
    this.license,
    this.merges_url,
    this.milestones_url,
    this.mirror_url,
    this.name,
    this.network_count,
    this.node_id,
    this.notifications_url,
    this.open_issues,
    this.open_issues_count,
    this.organization,
    this.owner,
    this.pulls_url,
    this.pushed_at,
    this.releases_url,
    this.size,
    this.ssh_url,
    this.stargazers_count,
    this.stargazers_url,
    this.statuses_url,
    this.subscribers_count,
    this.subscribers_url,
    this.subscription_url,
    this.svn_url,
    this.tags_url,
    this.teams_url,
    this.temp_clone_token,
    this.trees_url,
    this.updated_at,
    this.url,
    this.watchers,
    this.watchers_count,
  });

  @override
  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'] as int,
      private: json['private'] as bool,
      archive_url: json['archive_url'] as String,
      archived: json['archived'] as bool,
      assignees_url: json['assignees_url'] as String,
      blobs_url: json['blobs_url'] as String,
      branches_url: json['branches_url'] as String,
      clone_url: json['clone_url'] as String,
      collaborators_url: json['collaborators_url'] as String,
      comments_url: json['comments_url'] as String,
      commits_url: json['commits_url'] as String,
      compare_url: json['compare_url'] as String,
      contents_url: json['contents_url'] as String,
      contributors_url: json['contributors_url'] as String,
      created_at: json['created_at'] as String,
      default_branch: json['default_branch'] as String,
      deployments_url: json['deployments_url'] as String,
      description: json['description'] as String,
      disabled: json['disabled'] as bool,
      downloads_url: json['downloads_url'] as String,
      events_url: json['events_url'] as String,
      fork: json['fork'] as bool,
      forks: json['forks'] as int,
      forks_count: json['forks_count'] as int,
      forks_url: json['forks_url'] as String,
      full_name: json['full_name'] as String,
      git_commits_url: json['git_commits_url'] as String,
      git_refs_url: json['git_refs_url'] as String,
      git_tags_url: json['git_tags_url'] as String,
      git_url: json['git_url'] as String,
      has_downloads: json['has_downloads'] as bool,
      has_issues: json['has_issues'] as bool,
      has_pages: json['has_pages'] as bool,
      has_projects: json['has_projects'] as bool,
      has_wiki: json['has_wiki'] as bool,
      homepage: json['homepage'] as String,
      hooks_url: json['hooks_url'] as String,
      html_url: json['html_url'] as String,
      issue_comment_url: json['issue_comment_url'] as String,
      issue_events_url: json['issue_events_url'] as String,
      issues_url: json['issues_url'] as String,
      keys_url: json['keys_url'] as String,
      labels_url: json['labels_url'] as String,
      language: json['language'] as String,
      languages_url: json['languages_url'] as String,
      license: json['license'] != null
          ? License.fromJson(json['license'] as Map<String, dynamic>)
          : null,
      merges_url: json['merges_url'] as String,
      milestones_url: json['milestones_url'] as String,
      mirror_url: json['mirror_url'] as String,
      name: json['name'] as String,
      network_count: json['network_count'] as int,
      node_id: json['node_id'] as String,
      notifications_url: json['notifications_url'] as String,
      open_issues: json['open_issues'] as int,
      open_issues_count: json['open_issues_count'] as int,
      organization: json['organization'] != null
          ? Organization.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
      owner: json['owner'] != null
          ? User.fromJson(json['owner'] as Map<String, dynamic>)
          : null,
      pulls_url: json['pulls_url'] as String,
      pushed_at: json['pushed_at'] as String,
      releases_url: json['releases_url'] as String,
      size: json['size'] as int,
      ssh_url: json['ssh_url'] as String,
      stargazers_count: json['stargazers_count'] as int,
      stargazers_url: json['stargazers_url'] as String,
      statuses_url: json['statuses_url'] as String,
      subscribers_count: json['subscribers_count'] as int,
      subscribers_url: json['subscribers_url'] as String,
      subscription_url: json['subscription_url'] as String,
      svn_url: json['svn_url'] as String,
      tags_url: json['tags_url'] as String,
      teams_url: json['teams_url'] as String,
      temp_clone_token: json['temp_clone_token'] as String,
      trees_url: json['trees_url'] as String,
      updated_at: json['updated_at'] as String,
      url: json['url'] as String,
      watchers: json['watchers'] as int,
      watchers_count: json['watchers_count'] as int,
    );
  }

  final int id;
  final bool private;
  final String archive_url;
  final bool archived;
  final String assignees_url;
  final String blobs_url;
  final String branches_url;
  final String clone_url;
  final String collaborators_url;
  final String comments_url;
  final String commits_url;
  final String compare_url;
  final String contents_url;
  final String contributors_url;
  final String created_at;
  final String default_branch;
  final String deployments_url;
  final String description;
  final bool disabled;
  final String downloads_url;
  final String events_url;
  final bool fork;
  final int forks;
  final int forks_count;
  final String forks_url;
  final String full_name;
  final String git_commits_url;
  final String git_refs_url;
  final String git_tags_url;
  final String git_url;
  final bool has_downloads;
  final bool has_issues;
  final bool has_pages;
  final bool has_projects;
  final bool has_wiki;
  final String homepage;
  final String hooks_url;
  final String html_url;
  final String issue_comment_url;
  final String issue_events_url;
  final String issues_url;
  final String keys_url;
  final String labels_url;
  final String language;
  final String languages_url;
  final License license;
  final String merges_url;
  final String milestones_url;
  final String mirror_url;
  final String name;
  final int network_count;
  final String node_id;
  final String notifications_url;
  final int open_issues;
  final int open_issues_count;
  final Organization organization;
  final User owner;
  final String pulls_url;
  final String pushed_at;
  final String releases_url;
  final int size;
  final String ssh_url;
  final int stargazers_count;
  final String stargazers_url;
  final String statuses_url;
  final int subscribers_count;
  final String subscribers_url;
  final String subscription_url;
  final String svn_url;
  final String tags_url;
  final String teams_url;
  final String temp_clone_token;
  final String trees_url;
  final String updated_at;
  final String url;
  final int watchers;
  final int watchers_count;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'private': private,
      'archive_url': archive_url,
      'archived': archived,
      'assignees_url': assignees_url,
      'blobs_url': blobs_url,
      'branches_url': branches_url,
      'clone_url': clone_url,
      'collaborators_url': collaborators_url,
      'comments_url': comments_url,
      'commits_url': commits_url,
      'compare_url': compare_url,
      'contents_url': contents_url,
      'contributors_url': contributors_url,
      'created_at': created_at,
      'default_branch': default_branch,
      'deployments_url': deployments_url,
      'description': description,
      'disabled': disabled,
      'downloads_url': downloads_url,
      'events_url': events_url,
      'fork': fork,
      'forks': forks,
      'forks_count': forks_count,
      'forks_url': forks_url,
      'full_name': full_name,
      'git_commits_url': git_commits_url,
      'git_refs_url': git_refs_url,
      'git_tags_url': git_tags_url,
      'git_url': git_url,
      'has_downloads': has_downloads,
      'has_issues': has_issues,
      'has_pages': has_pages,
      'has_projects': has_projects,
      'has_wiki': has_wiki,
      'homepage': homepage,
      'hooks_url': hooks_url,
      'html_url': html_url,
      'id': id,
      'issue_comment_url': issue_comment_url,
      'issue_events_url': issue_events_url,
      'issues_url': issues_url,
      'keys_url': keys_url,
      'labels_url': labels_url,
      'language': language,
      'languages_url': languages_url,
      'merges_url': merges_url,
      'milestones_url': milestones_url,
      'name': name,
      'network_count': network_count,
      'node_id': node_id,
      'notifications_url': notifications_url,
      'open_issues': open_issues,
      'open_issues_count': open_issues_count,
      'pulls_url': pulls_url,
      'pushed_at': pushed_at,
      'releases_url': releases_url,
      'size': size,
      'ssh_url': ssh_url,
      'stargazers_count': stargazers_count,
      'stargazers_url': stargazers_url,
      'statuses_url': statuses_url,
      'subscribers_count': subscribers_count,
      'subscribers_url': subscribers_url,
      'subscription_url': subscription_url,
      'svn_url': svn_url,
      'tags_url': tags_url,
      'teams_url': teams_url,
      'trees_url': trees_url,
      'updated_at': updated_at,
      'url': url,
      'watchers': watchers,
      'watchers_count': watchers_count,
      'license': license?.toJson(),
      'mirror_url': mirror_url,
      'organization': organization?.toJson(),
      'owner': owner?.toJson(),
      'temp_clone_token': temp_clone_token,
    };
    return data;
  }
}
