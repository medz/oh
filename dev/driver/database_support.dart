/// Database support schema
abstract interface class DatabaseSupportSchema {}

/// Database support returning
abstract interface class DatabaseSupportReturning {}

/// Database support create if not exists
abstract interface class DatabaseSupportCreateIfNotExists {}

/// Whether or not this dialect supports transactional DDL.
abstract interface class DatabaseSupportTransactionalDDL {}
