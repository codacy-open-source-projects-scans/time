#!/bin/sh
# Test that 'time' doesn't close standard error in the child process.

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

# A previous Fedora patch accidentally closed standard error in the child, which
# would lead to the command below exiting with a non-zero status. See:
# <https://bugzilla.redhat.com/show_bug.cgi?id=1898138>.
env time sh -c 'echo test >&2' || fail=1

Exit $fail
