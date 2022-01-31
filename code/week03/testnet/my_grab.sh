cardano-cli transaction build \
    --alonzo-era \
    --testnet-magic 1097911063 \
    --change-address $(cat 02.addr) \
    --tx-in 0193585a31c0d8032d46fb274d8482d357c8c7091ee02d2707b35963a5f334f9#1 \
    --tx-in-script-file vesting.plutus \
    --tx-in-datum-file unit.json \
    --tx-in-redeemer-file unit.json \
    --tx-in-collateral ee96ef4557cb94d723c9327db9a3a9bc937bd1ff9a0193a392daa5518cb019ec#1 \
    --required-signer-hash 27b8c7685cf893564392239bad43e2894bf99a5f67c8be0d232858b2 \
    --invalid-before 49142972 \
    --protocol-params-file protocol.json \
    --out-file tx.body

cardano-cli transaction sign \
    --tx-body-file tx.body \
    --signing-key-file 02.skey \
    --testnet-magic 1097911063 \
    --out-file tx.signed

cardano-cli transaction submit \
    --testnet-magic 1097911063 \
    --tx-file tx.signed
