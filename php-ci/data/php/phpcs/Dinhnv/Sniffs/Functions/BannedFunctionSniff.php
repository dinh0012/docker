<?php

/**
 * 禁止された関数のチェック
 */
class Dinhnv_Sniffs_Functions_BannedFunctionSniff implements \PHP_CodeSniffer\Sniffs\Sniff
{
    /**
     * 実行速度が遅く、代替処理が存在する関数のリスト
     *
     * @var array
     */
    protected $slowFunctions = [
        //'array_push'       => '$array[]',
    ];

    protected $debugFunctions = [
        'var_dump' => 1,
        'print_r' => 1,
        'dd' => 1,
    ];

    /**
     * Returns an array of tokens this test wants to listen for.
     *
     * @return array
     */
    public function register()
    {
        return array(T_STRING);
    }

    /**
     * Processes this sniff, when one of its tokens is encountered.
     *
     * @param PHP_CodeSniffer_File $phpcsFile The file being scanned.
     * @param int                  $stackPtr  The position of the current token
     *                                        in the stack passed in $tokens.
     *
     * @return void
     */
    public function process(PHP_CodeSniffer\Files\File $phpcsFile, $stackPtr)
    {
        $tokens = $phpcsFile->getTokens();

        $content = $tokens[$stackPtr]['content'];
        if (isset($this->debugFunctions[$content])) {
            // 遅い関数のエラーを追加する
            $error = 'This function is debug code %s';
            $phpcsFile->addError($error, $stackPtr, 'BannedFunction', $content);
        }
        if (isset($this->slowFunctions[$content])) {
            // 遅い関数のエラーを追加する
            $error = 'This function can be replaced with %s';
            $phpcsFile->addError($error, $stackPtr, 'SlowFunction', $this->slowFunctions[$content]);
        }
    }
}
