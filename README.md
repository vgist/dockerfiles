<https://hub.docker.com/u/gists/>

The action is triggered by [workflows push paths event](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestpaths) or [the repo's dispatch event](https://developer.github.com/v3/repos/#create-a-repository-dispatch-event).

Fork this repo, get your own [personal access token](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line).

`POST /repos/:owner/:repo/dispatches`

Trigger with curl command, example,

```
curl -H "Accept: application/Accept: application/vnd.github.v3.full+json" \
-H "Authorization: token your-personal-token" \
--request POST \
--data '{"event_type": "frp-build"}' \
https://api.github.com/repos/vgist/dockerfiles/dispatches
```

or

```
curl -H "Accept: application/Accept: application/vnd.github.v3.full+json" \
-H "Authorization: token your-personal-token" \
--request POST \
--data '{"event_type": "frp-build", "client_payload": { "version": "0.33.0"}}' \
https://api.github.com/repos/vgist/dockerfiles/dispatches
```
