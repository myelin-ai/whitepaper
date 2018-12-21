#!/usr/bin/env python3

import json
from datetime import datetime

METADATA_FILE = 'whitepaper.json'

updated_at = datetime.now().isoformat()

with open(METADATA_FILE, 'w+') as f:
    json.dump({'updated_at': updated_at}, f, indent=2, sort_keys=True)
