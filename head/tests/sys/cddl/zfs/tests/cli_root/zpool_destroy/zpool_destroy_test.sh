# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2012 Spectra Logic.  All rights reserved.
# Use is subject to license terms.
#


atf_test_case zpool_destroy_001_pos cleanup
zpool_destroy_001_pos_head()
{
	atf_set "descr" "'zpool destroy <pool>' can destroy a specified pool."
	atf_set "require.config"  disks_are_physical
	atf_set "require.progs"  zfs zpool
}
zpool_destroy_001_pos_body()
{
	atf_expect_fail 'BUG26166 cannot create pools on zvols'
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/zpool_destroy_001_pos.ksh || atf_fail "Testcase failed"
}
zpool_destroy_001_pos_cleanup()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/cleanup.ksh || atf_fail "Cleanup failed"
}


atf_test_case zpool_destroy_002_pos cleanup
zpool_destroy_002_pos_head()
{
	atf_set "descr" "'zpool destroy -f <pool>' can forcely destroy the specified pool"
	atf_set "require.progs"  zfs zpool
}
zpool_destroy_002_pos_body()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/zpool_destroy_002_pos.ksh || atf_fail "Testcase failed"
}
zpool_destroy_002_pos_cleanup()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/cleanup.ksh || atf_fail "Cleanup failed"
}


atf_test_case zpool_destroy_003_neg cleanup
zpool_destroy_003_neg_head()
{
	atf_set "descr" "'zpool destroy' should return an error with badly-formed parameters."
	atf_set "require.progs"  zpool
}
zpool_destroy_003_neg_body()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/zpool_destroy_003_neg.ksh || atf_fail "Testcase failed"
}
zpool_destroy_003_neg_cleanup()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/cleanup.ksh || atf_fail "Cleanup failed"
}


atf_test_case zpool_destroy_004_pos cleanup
zpool_destroy_004_pos_head()
{
	atf_set "descr" "'zpool destroy -f' should work on active pools."
	atf_set "require.progs" zfs zpool
	atf_set "require.config" at_least_2_disks
	atf_set "timeout" 2000
}
zpool_destroy_004_pos_body()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/zpool_destroy_004_pos.ksh || atf_fail "Testcase failed"
}
zpool_destroy_004_pos_cleanup()
{
	export TESTCASE_ID=$(echo $(atf_get ident) | cksum -o 2 | cut -f 1 -d " ")
	. $(atf_get_srcdir)/../../../include/default.cfg
	. $(atf_get_srcdir)/zpool_destroy.cfg

	ksh93 $(atf_get_srcdir)/cleanup.ksh || atf_fail "Cleanup failed"
}


atf_init_test_cases()
{

	atf_add_test_case zpool_destroy_001_pos
	atf_add_test_case zpool_destroy_002_pos
	atf_add_test_case zpool_destroy_003_neg
	atf_add_test_case zpool_destroy_004_pos
}
