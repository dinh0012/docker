function phpunit_run()
{
	$BIN_DIR/initDatabase test
	$BIN_DIR/yii-test migrate --migrationPath=@yii/rbac/migrations --interactive=0
	$BIN_DIR/yii-test migrate --interactive=0
	$VAR_DIR/bin/codecept run
}
