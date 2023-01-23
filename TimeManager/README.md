# My knowledge about time managements

- [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)

## Bash

- Epochtime to String

```bash
date --date @1639114001
date -d @1639114001
```

- Epochtime to String with UTC

```bash
date --utc --date @1639114001
date -u -d @1639114001
```

## Python 3

- Epochtime to ISO 8601

```python
import datetime
datetime.datetime.fromisoformat('2021-12-03T09:12:44+09:00').timestamp()
```

- ISO 8601 to Epochtime

```python
import datetime
datetime.datetime.fromtimestamp(1638972557)
```

- ISO 8601 to Epochtime with timezone

```python
import datetime
datetime.datetime.fromtimestamp(time.time(), tz=KST).isoformat()
```

- ISO 8601 with `Z` to Epochtime (until Python 3.8 at least)

```python
import datetime
datetime.datetime.fromisoformat('2023-01-23T01:00:00Z'.replace('Z', '+00:00'))
```
