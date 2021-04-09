local utils = require('utils')

utils.map('n', 'G', 'Gzz')
utils.map('n', 'n', 'nzz')

utils.map('i', 'jj', '<Esc>')

utils.map('v', '<leader>64d', 'c<c-r>=system(\'base64 --decode\', @")<cr><esc>')
utils.map('v', '<leader>64e', 'c<c-r>=system(\'base64\', @")<cr><esc>')
