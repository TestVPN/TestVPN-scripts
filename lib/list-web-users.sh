#!/bin/bash
echo "SELECT Username FROM Accounts;" | sqlite3 ../users.db
