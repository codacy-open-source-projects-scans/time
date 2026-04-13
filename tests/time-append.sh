#!/bin/sh
# Test the --append (-a) option.

# Copyright (C) 2026 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src

for option in '-a' '--append'; do
  # Check that we append to the output file.
  echo a > out
  env time $option -o out true || fail=1
  test $(wc -l < out) -eq 3 || fail=1
  # Test that we truncate the file without the option.
  env time -o out true || fail=1
  test $(wc -l < out) -eq 2 || fail=1
done

Exit $fail
