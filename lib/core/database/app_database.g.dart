// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PharmaciesTableTable extends PharmaciesTable
    with TableInfo<$PharmaciesTableTable, PharmacyDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PharmaciesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licenseNumberMeta = const VerificationMeta(
    'licenseNumber',
  );
  @override
  late final GeneratedColumn<String> licenseNumber = GeneratedColumn<String>(
    'license_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, licenseNumber, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pharmacies_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PharmacyDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('license_number')) {
      context.handle(
        _licenseNumberMeta,
        licenseNumber.isAcceptableOrUnknown(
          data['license_number']!,
          _licenseNumberMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PharmacyDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PharmacyDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      licenseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license_number'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PharmaciesTableTable createAlias(String alias) {
    return $PharmaciesTableTable(attachedDatabase, alias);
  }
}

class PharmacyDbModel extends DataClass implements Insertable<PharmacyDbModel> {
  final int id;
  final String name;
  final String? licenseNumber;
  final DateTime createdAt;
  const PharmacyDbModel({
    required this.id,
    required this.name,
    this.licenseNumber,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || licenseNumber != null) {
      map['license_number'] = Variable<String>(licenseNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PharmaciesTableCompanion toCompanion(bool nullToAbsent) {
    return PharmaciesTableCompanion(
      id: Value(id),
      name: Value(name),
      licenseNumber: licenseNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(licenseNumber),
      createdAt: Value(createdAt),
    );
  }

  factory PharmacyDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PharmacyDbModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      licenseNumber: serializer.fromJson<String?>(json['licenseNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'licenseNumber': serializer.toJson<String?>(licenseNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PharmacyDbModel copyWith({
    int? id,
    String? name,
    Value<String?> licenseNumber = const Value.absent(),
    DateTime? createdAt,
  }) => PharmacyDbModel(
    id: id ?? this.id,
    name: name ?? this.name,
    licenseNumber: licenseNumber.present
        ? licenseNumber.value
        : this.licenseNumber,
    createdAt: createdAt ?? this.createdAt,
  );
  PharmacyDbModel copyWithCompanion(PharmaciesTableCompanion data) {
    return PharmacyDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      licenseNumber: data.licenseNumber.present
          ? data.licenseNumber.value
          : this.licenseNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PharmacyDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('licenseNumber: $licenseNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, licenseNumber, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PharmacyDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.licenseNumber == this.licenseNumber &&
          other.createdAt == this.createdAt);
}

class PharmaciesTableCompanion extends UpdateCompanion<PharmacyDbModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> licenseNumber;
  final Value<DateTime> createdAt;
  const PharmaciesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.licenseNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PharmaciesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.licenseNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PharmacyDbModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? licenseNumber,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (licenseNumber != null) 'license_number': licenseNumber,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PharmaciesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? licenseNumber,
    Value<DateTime>? createdAt,
  }) {
    return PharmaciesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (licenseNumber.present) {
      map['license_number'] = Variable<String>(licenseNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PharmaciesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('licenseNumber: $licenseNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UserDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    name,
    email,
    phoneNumber,
    passwordHash,
    role,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UserDbModel extends DataClass implements Insertable<UserDbModel> {
  final int id;
  final int pharmacyId;
  final String name;
  final String? email;
  final String? phoneNumber;
  final String passwordHash;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  const UserDbModel({
    required this.id,
    required this.pharmacyId,
    required this.name,
    this.email,
    this.phoneNumber,
    required this.passwordHash,
    required this.role,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['password_hash'] = Variable<String>(passwordHash);
    map['role'] = Variable<String>(role);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      passwordHash: Value(passwordHash),
      role: Value(role),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory UserDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      role: serializer.fromJson<String>(json['role']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'role': serializer.toJson<String>(role),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserDbModel copyWith({
    int? id,
    int? pharmacyId,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    String? passwordHash,
    String? role,
    bool? isActive,
    DateTime? createdAt,
  }) => UserDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    passwordHash: passwordHash ?? this.passwordHash,
    role: role ?? this.role,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  UserDbModel copyWithCompanion(UsersTableCompanion data) {
    return UserDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pharmacyId,
    name,
    email,
    phoneNumber,
    passwordHash,
    role,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.name == this.name &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.passwordHash == this.passwordHash &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class UsersTableCompanion extends UpdateCompanion<UserDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<String> passwordHash;
  final Value<String> role;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required String name,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    required String passwordHash,
    required String role,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : pharmacyId = Value(pharmacyId),
       name = Value(name),
       passwordHash = Value(passwordHash),
       role = Value(role);
  static Insertable<UserDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? passwordHash,
    Expression<String>? role,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phoneNumber,
    Value<String>? passwordHash,
    Value<String>? role,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return UsersTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CustomersTableTable extends CustomersTable
    with TableInfo<$CustomersTableTable, CustomerDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalDebtMeta = const VerificationMeta(
    'totalDebt',
  );
  @override
  late final GeneratedColumn<double> totalDebt = GeneratedColumn<double>(
    'total_debt',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    name,
    phone,
    totalDebt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('total_debt')) {
      context.handle(
        _totalDebtMeta,
        totalDebt.isAcceptableOrUnknown(data['total_debt']!, _totalDebtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      totalDebt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_debt'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomersTableTable createAlias(String alias) {
    return $CustomersTableTable(attachedDatabase, alias);
  }
}

class CustomerDbModel extends DataClass implements Insertable<CustomerDbModel> {
  final int id;
  final int pharmacyId;
  final String name;
  final String? phone;
  final double totalDebt;
  final DateTime createdAt;
  const CustomerDbModel({
    required this.id,
    required this.pharmacyId,
    required this.name,
    this.phone,
    required this.totalDebt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['total_debt'] = Variable<double>(totalDebt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomersTableCompanion toCompanion(bool nullToAbsent) {
    return CustomersTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      totalDebt: Value(totalDebt),
      createdAt: Value(createdAt),
    );
  }

  factory CustomerDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      totalDebt: serializer.fromJson<double>(json['totalDebt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'totalDebt': serializer.toJson<double>(totalDebt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomerDbModel copyWith({
    int? id,
    int? pharmacyId,
    String? name,
    Value<String?> phone = const Value.absent(),
    double? totalDebt,
    DateTime? createdAt,
  }) => CustomerDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    totalDebt: totalDebt ?? this.totalDebt,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomerDbModel copyWithCompanion(CustomersTableCompanion data) {
    return CustomerDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      totalDebt: data.totalDebt.present ? data.totalDebt.value : this.totalDebt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('totalDebt: $totalDebt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pharmacyId, name, phone, totalDebt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.totalDebt == this.totalDebt &&
          other.createdAt == this.createdAt);
}

class CustomersTableCompanion extends UpdateCompanion<CustomerDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<String> name;
  final Value<String?> phone;
  final Value<double> totalDebt;
  final Value<DateTime> createdAt;
  const CustomersTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.totalDebt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomersTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required String name,
    this.phone = const Value.absent(),
    this.totalDebt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : pharmacyId = Value(pharmacyId),
       name = Value(name);
  static Insertable<CustomerDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<double>? totalDebt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (totalDebt != null) 'total_debt': totalDebt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<String>? name,
    Value<String?>? phone,
    Value<double>? totalDebt,
    Value<DateTime>? createdAt,
  }) {
    return CustomersTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      totalDebt: totalDebt ?? this.totalDebt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (totalDebt.present) {
      map['total_debt'] = Variable<double>(totalDebt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('totalDebt: $totalDebt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTableTable extends CategoriesTable
    with TableInfo<$CategoriesTableTable, CategoryDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, pharmacyId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTableTable createAlias(String alias) {
    return $CategoriesTableTable(attachedDatabase, alias);
  }
}

class CategoryDbModel extends DataClass implements Insertable<CategoryDbModel> {
  final int id;
  final int pharmacyId;
  final String name;
  const CategoryDbModel({
    required this.id,
    required this.pharmacyId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      name: Value(name),
    );
  }

  factory CategoryDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryDbModel copyWith({int? id, int? pharmacyId, String? name}) =>
      CategoryDbModel(
        id: id ?? this.id,
        pharmacyId: pharmacyId ?? this.pharmacyId,
        name: name ?? this.name,
      );
  CategoryDbModel copyWithCompanion(CategoriesTableCompanion data) {
    return CategoryDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pharmacyId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.name == this.name);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoryDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<String> name;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required String name,
  }) : pharmacyId = Value(pharmacyId),
       name = Value(name);
  static Insertable<CategoryDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (name != null) 'name': name,
    });
  }

  CategoriesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<String>? name,
  }) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ManufacturersTableTable extends ManufacturersTable
    with TableInfo<$ManufacturersTableTable, ManufacturerDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ManufacturersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, pharmacyId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'manufacturers_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ManufacturerDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ManufacturerDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ManufacturerDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $ManufacturersTableTable createAlias(String alias) {
    return $ManufacturersTableTable(attachedDatabase, alias);
  }
}

class ManufacturerDbModel extends DataClass
    implements Insertable<ManufacturerDbModel> {
  final int id;
  final int pharmacyId;
  final String name;
  const ManufacturerDbModel({
    required this.id,
    required this.pharmacyId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['name'] = Variable<String>(name);
    return map;
  }

  ManufacturersTableCompanion toCompanion(bool nullToAbsent) {
    return ManufacturersTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      name: Value(name),
    );
  }

  factory ManufacturerDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ManufacturerDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'name': serializer.toJson<String>(name),
    };
  }

  ManufacturerDbModel copyWith({int? id, int? pharmacyId, String? name}) =>
      ManufacturerDbModel(
        id: id ?? this.id,
        pharmacyId: pharmacyId ?? this.pharmacyId,
        name: name ?? this.name,
      );
  ManufacturerDbModel copyWithCompanion(ManufacturersTableCompanion data) {
    return ManufacturerDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ManufacturerDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pharmacyId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ManufacturerDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.name == this.name);
}

class ManufacturersTableCompanion extends UpdateCompanion<ManufacturerDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<String> name;
  const ManufacturersTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ManufacturersTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required String name,
  }) : pharmacyId = Value(pharmacyId),
       name = Value(name);
  static Insertable<ManufacturerDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (name != null) 'name': name,
    });
  }

  ManufacturersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<String>? name,
  }) {
    return ManufacturersTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ManufacturersTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTableTable extends SuppliersTable
    with TableInfo<$SuppliersTableTable, SupplierDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    name,
    companyName,
    phone,
    openingBalance,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}opening_balance'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SuppliersTableTable createAlias(String alias) {
    return $SuppliersTableTable(attachedDatabase, alias);
  }
}

class SupplierDbModel extends DataClass implements Insertable<SupplierDbModel> {
  final int id;
  final int pharmacyId;
  final String name;
  final String? companyName;
  final String? phone;
  final double openingBalance;
  final DateTime createdAt;
  const SupplierDbModel({
    required this.id,
    required this.pharmacyId,
    required this.name,
    this.companyName,
    this.phone,
    required this.openingBalance,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['opening_balance'] = Variable<double>(openingBalance);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SuppliersTableCompanion toCompanion(bool nullToAbsent) {
    return SuppliersTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      name: Value(name),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      openingBalance: Value(openingBalance),
      createdAt: Value(createdAt),
    );
  }

  factory SupplierDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      name: serializer.fromJson<String>(json['name']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      phone: serializer.fromJson<String?>(json['phone']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'name': serializer.toJson<String>(name),
      'companyName': serializer.toJson<String?>(companyName),
      'phone': serializer.toJson<String?>(phone),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SupplierDbModel copyWith({
    int? id,
    int? pharmacyId,
    String? name,
    Value<String?> companyName = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    double? openingBalance,
    DateTime? createdAt,
  }) => SupplierDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    name: name ?? this.name,
    companyName: companyName.present ? companyName.value : this.companyName,
    phone: phone.present ? phone.value : this.phone,
    openingBalance: openingBalance ?? this.openingBalance,
    createdAt: createdAt ?? this.createdAt,
  );
  SupplierDbModel copyWithCompanion(SuppliersTableCompanion data) {
    return SupplierDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      name: data.name.present ? data.name.value : this.name,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      phone: data.phone.present ? data.phone.value : this.phone,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('phone: $phone, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pharmacyId,
    name,
    companyName,
    phone,
    openingBalance,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.name == this.name &&
          other.companyName == this.companyName &&
          other.phone == this.phone &&
          other.openingBalance == this.openingBalance &&
          other.createdAt == this.createdAt);
}

class SuppliersTableCompanion extends UpdateCompanion<SupplierDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<String> name;
  final Value<String?> companyName;
  final Value<String?> phone;
  final Value<double> openingBalance;
  final Value<DateTime> createdAt;
  const SuppliersTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.name = const Value.absent(),
    this.companyName = const Value.absent(),
    this.phone = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SuppliersTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required String name,
    this.companyName = const Value.absent(),
    this.phone = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : pharmacyId = Value(pharmacyId),
       name = Value(name);
  static Insertable<SupplierDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<String>? name,
    Expression<String>? companyName,
    Expression<String>? phone,
    Expression<double>? openingBalance,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (name != null) 'name': name,
      if (companyName != null) 'company_name': companyName,
      if (phone != null) 'phone': phone,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SuppliersTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<String>? name,
    Value<String?>? companyName,
    Value<String?>? phone,
    Value<double>? openingBalance,
    Value<DateTime>? createdAt,
  }) {
    return SuppliersTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      phone: phone ?? this.phone,
      openingBalance: openingBalance ?? this.openingBalance,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('name: $name, ')
          ..write('companyName: $companyName, ')
          ..write('phone: $phone, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SupplierPaymentsTableTable extends SupplierPaymentsTable
    with TableInfo<$SupplierPaymentsTableTable, SupplierPaymentDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierPaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES suppliers_table (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    amount,
    paymentDate,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_payments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierPaymentDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierPaymentDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierPaymentDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SupplierPaymentsTableTable createAlias(String alias) {
    return $SupplierPaymentsTableTable(attachedDatabase, alias);
  }
}

class SupplierPaymentDbModel extends DataClass
    implements Insertable<SupplierPaymentDbModel> {
  final int id;
  final int supplierId;
  final double amount;
  final DateTime paymentDate;
  final String? notes;
  final DateTime createdAt;
  const SupplierPaymentDbModel({
    required this.id,
    required this.supplierId,
    required this.amount,
    required this.paymentDate,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['amount'] = Variable<double>(amount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SupplierPaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return SupplierPaymentsTableCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      amount: Value(amount),
      paymentDate: Value(paymentDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory SupplierPaymentDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierPaymentDbModel(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'amount': serializer.toJson<double>(amount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SupplierPaymentDbModel copyWith({
    int? id,
    int? supplierId,
    double? amount,
    DateTime? paymentDate,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => SupplierPaymentDbModel(
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    amount: amount ?? this.amount,
    paymentDate: paymentDate ?? this.paymentDate,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  SupplierPaymentDbModel copyWithCompanion(
    SupplierPaymentsTableCompanion data,
  ) {
    return SupplierPaymentDbModel(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierPaymentDbModel(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, supplierId, amount, paymentDate, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierPaymentDbModel &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.amount == this.amount &&
          other.paymentDate == this.paymentDate &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SupplierPaymentsTableCompanion
    extends UpdateCompanion<SupplierPaymentDbModel> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<double> amount;
  final Value<DateTime> paymentDate;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const SupplierPaymentsTableCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SupplierPaymentsTableCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required double amount,
    required DateTime paymentDate,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : supplierId = Value(supplierId),
       amount = Value(amount),
       paymentDate = Value(paymentDate);
  static Insertable<SupplierPaymentDbModel> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<double>? amount,
    Expression<DateTime>? paymentDate,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (amount != null) 'amount': amount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SupplierPaymentsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? supplierId,
    Value<double>? amount,
    Value<DateTime>? paymentDate,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return SupplierPaymentsTableCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierPaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoicesTableTable extends PurchaseInvoicesTable
    with TableInfo<$PurchaseInvoicesTableTable, PurchaseInvoiceDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoicesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES suppliers_table (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _invoiceDateMeta = const VerificationMeta(
    'invoiceDate',
  );
  @override
  late final GeneratedColumn<DateTime> invoiceDate = GeneratedColumn<DateTime>(
    'invoice_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    invoiceNumber,
    invoiceDate,
    totalAmount,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoices_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseInvoiceDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    }
    if (data.containsKey('invoice_date')) {
      context.handle(
        _invoiceDateMeta,
        invoiceDate.isAcceptableOrUnknown(
          data['invoice_date']!,
          _invoiceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceDateMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoiceDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoiceDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      )!,
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_number'],
      ),
      invoiceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}invoice_date'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PurchaseInvoicesTableTable createAlias(String alias) {
    return $PurchaseInvoicesTableTable(attachedDatabase, alias);
  }
}

class PurchaseInvoiceDbModel extends DataClass
    implements Insertable<PurchaseInvoiceDbModel> {
  final int id;
  final int supplierId;
  final String? invoiceNumber;
  final DateTime invoiceDate;
  final double totalAmount;
  final String? notes;
  final DateTime createdAt;
  const PurchaseInvoiceDbModel({
    required this.id,
    required this.supplierId,
    this.invoiceNumber,
    required this.invoiceDate,
    required this.totalAmount,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    if (!nullToAbsent || invoiceNumber != null) {
      map['invoice_number'] = Variable<String>(invoiceNumber);
    }
    map['invoice_date'] = Variable<DateTime>(invoiceDate);
    map['total_amount'] = Variable<double>(totalAmount);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PurchaseInvoicesTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoicesTableCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      invoiceNumber: invoiceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceNumber),
      invoiceDate: Value(invoiceDate),
      totalAmount: Value(totalAmount),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PurchaseInvoiceDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoiceDbModel(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      invoiceNumber: serializer.fromJson<String?>(json['invoiceNumber']),
      invoiceDate: serializer.fromJson<DateTime>(json['invoiceDate']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'invoiceNumber': serializer.toJson<String?>(invoiceNumber),
      'invoiceDate': serializer.toJson<DateTime>(invoiceDate),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PurchaseInvoiceDbModel copyWith({
    int? id,
    int? supplierId,
    Value<String?> invoiceNumber = const Value.absent(),
    DateTime? invoiceDate,
    double? totalAmount,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => PurchaseInvoiceDbModel(
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    invoiceNumber: invoiceNumber.present
        ? invoiceNumber.value
        : this.invoiceNumber,
    invoiceDate: invoiceDate ?? this.invoiceDate,
    totalAmount: totalAmount ?? this.totalAmount,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PurchaseInvoiceDbModel copyWithCompanion(
    PurchaseInvoicesTableCompanion data,
  ) {
    return PurchaseInvoiceDbModel(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      invoiceDate: data.invoiceDate.present
          ? data.invoiceDate.value
          : this.invoiceDate,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoiceDbModel(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    supplierId,
    invoiceNumber,
    invoiceDate,
    totalAmount,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoiceDbModel &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.invoiceNumber == this.invoiceNumber &&
          other.invoiceDate == this.invoiceDate &&
          other.totalAmount == this.totalAmount &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PurchaseInvoicesTableCompanion
    extends UpdateCompanion<PurchaseInvoiceDbModel> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<String?> invoiceNumber;
  final Value<DateTime> invoiceDate;
  final Value<double> totalAmount;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const PurchaseInvoicesTableCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.invoiceDate = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PurchaseInvoicesTableCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    this.invoiceNumber = const Value.absent(),
    required DateTime invoiceDate,
    required double totalAmount,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : supplierId = Value(supplierId),
       invoiceDate = Value(invoiceDate),
       totalAmount = Value(totalAmount);
  static Insertable<PurchaseInvoiceDbModel> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<String>? invoiceNumber,
    Expression<DateTime>? invoiceDate,
    Expression<double>? totalAmount,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (invoiceDate != null) 'invoice_date': invoiceDate,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PurchaseInvoicesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? supplierId,
    Value<String?>? invoiceNumber,
    Value<DateTime>? invoiceDate,
    Value<double>? totalAmount,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return PurchaseInvoicesTableCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      totalAmount: totalAmount ?? this.totalAmount,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (invoiceDate.present) {
      map['invoice_date'] = Variable<DateTime>(invoiceDate.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoicesTableCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<String> pharmacyId = GeneratedColumn<String>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _masterDrugIdMeta = const VerificationMeta(
    'masterDrugId',
  );
  @override
  late final GeneratedColumn<String> masterDrugId = GeneratedColumn<String>(
    'master_drug_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localNameMeta = const VerificationMeta(
    'localName',
  );
  @override
  late final GeneratedColumn<String> localName = GeneratedColumn<String>(
    'local_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minStockThresholdMeta = const VerificationMeta(
    'minStockThreshold',
  );
  @override
  late final GeneratedColumn<double> minStockThreshold =
      GeneratedColumn<double>(
        'min_stock_threshold',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    masterDrugId,
    localName,
    barcode,
    minStockThreshold,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('master_drug_id')) {
      context.handle(
        _masterDrugIdMeta,
        masterDrugId.isAcceptableOrUnknown(
          data['master_drug_id']!,
          _masterDrugIdMeta,
        ),
      );
    }
    if (data.containsKey('local_name')) {
      context.handle(
        _localNameMeta,
        localName.isAcceptableOrUnknown(data['local_name']!, _localNameMeta),
      );
    } else if (isInserting) {
      context.missing(_localNameMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('min_stock_threshold')) {
      context.handle(
        _minStockThresholdMeta,
        minStockThreshold.isAcceptableOrUnknown(
          data['min_stock_threshold']!,
          _minStockThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minStockThresholdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      masterDrugId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}master_drug_id'],
      ),
      localName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_name'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      minStockThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_stock_threshold'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductDbModel extends DataClass implements Insertable<ProductDbModel> {
  final String id;
  final String pharmacyId;
  final String? masterDrugId;
  final String localName;
  final String? barcode;
  final double minStockThreshold;
  final DateTime? updatedAt;
  final bool isSynced;
  const ProductDbModel({
    required this.id,
    required this.pharmacyId,
    this.masterDrugId,
    required this.localName,
    this.barcode,
    required this.minStockThreshold,
    this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pharmacy_id'] = Variable<String>(pharmacyId);
    if (!nullToAbsent || masterDrugId != null) {
      map['master_drug_id'] = Variable<String>(masterDrugId);
    }
    map['local_name'] = Variable<String>(localName);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['min_stock_threshold'] = Variable<double>(minStockThreshold);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      masterDrugId: masterDrugId == null && nullToAbsent
          ? const Value.absent()
          : Value(masterDrugId),
      localName: Value(localName),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      minStockThreshold: Value(minStockThreshold),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory ProductDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDbModel(
      id: serializer.fromJson<String>(json['id']),
      pharmacyId: serializer.fromJson<String>(json['pharmacyId']),
      masterDrugId: serializer.fromJson<String?>(json['masterDrugId']),
      localName: serializer.fromJson<String>(json['localName']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      minStockThreshold: serializer.fromJson<double>(json['minStockThreshold']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pharmacyId': serializer.toJson<String>(pharmacyId),
      'masterDrugId': serializer.toJson<String?>(masterDrugId),
      'localName': serializer.toJson<String>(localName),
      'barcode': serializer.toJson<String?>(barcode),
      'minStockThreshold': serializer.toJson<double>(minStockThreshold),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ProductDbModel copyWith({
    String? id,
    String? pharmacyId,
    Value<String?> masterDrugId = const Value.absent(),
    String? localName,
    Value<String?> barcode = const Value.absent(),
    double? minStockThreshold,
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSynced,
  }) => ProductDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    masterDrugId: masterDrugId.present ? masterDrugId.value : this.masterDrugId,
    localName: localName ?? this.localName,
    barcode: barcode.present ? barcode.value : this.barcode,
    minStockThreshold: minStockThreshold ?? this.minStockThreshold,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  ProductDbModel copyWithCompanion(ProductsTableCompanion data) {
    return ProductDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      masterDrugId: data.masterDrugId.present
          ? data.masterDrugId.value
          : this.masterDrugId,
      localName: data.localName.present ? data.localName.value : this.localName,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      minStockThreshold: data.minStockThreshold.present
          ? data.minStockThreshold.value
          : this.minStockThreshold,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('masterDrugId: $masterDrugId, ')
          ..write('localName: $localName, ')
          ..write('barcode: $barcode, ')
          ..write('minStockThreshold: $minStockThreshold, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pharmacyId,
    masterDrugId,
    localName,
    barcode,
    minStockThreshold,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.masterDrugId == this.masterDrugId &&
          other.localName == this.localName &&
          other.barcode == this.barcode &&
          other.minStockThreshold == this.minStockThreshold &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class ProductsTableCompanion extends UpdateCompanion<ProductDbModel> {
  final Value<String> id;
  final Value<String> pharmacyId;
  final Value<String?> masterDrugId;
  final Value<String> localName;
  final Value<String?> barcode;
  final Value<double> minStockThreshold;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.masterDrugId = const Value.absent(),
    this.localName = const Value.absent(),
    this.barcode = const Value.absent(),
    this.minStockThreshold = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    required String id,
    required String pharmacyId,
    this.masterDrugId = const Value.absent(),
    required String localName,
    this.barcode = const Value.absent(),
    required double minStockThreshold,
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pharmacyId = Value(pharmacyId),
       localName = Value(localName),
       minStockThreshold = Value(minStockThreshold);
  static Insertable<ProductDbModel> custom({
    Expression<String>? id,
    Expression<String>? pharmacyId,
    Expression<String>? masterDrugId,
    Expression<String>? localName,
    Expression<String>? barcode,
    Expression<double>? minStockThreshold,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (masterDrugId != null) 'master_drug_id': masterDrugId,
      if (localName != null) 'local_name': localName,
      if (barcode != null) 'barcode': barcode,
      if (minStockThreshold != null) 'min_stock_threshold': minStockThreshold,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? pharmacyId,
    Value<String?>? masterDrugId,
    Value<String>? localName,
    Value<String?>? barcode,
    Value<double>? minStockThreshold,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      masterDrugId: masterDrugId ?? this.masterDrugId,
      localName: localName ?? this.localName,
      barcode: barcode ?? this.barcode,
      minStockThreshold: minStockThreshold ?? this.minStockThreshold,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<String>(pharmacyId.value);
    }
    if (masterDrugId.present) {
      map['master_drug_id'] = Variable<String>(masterDrugId.value);
    }
    if (localName.present) {
      map['local_name'] = Variable<String>(localName.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (minStockThreshold.present) {
      map['min_stock_threshold'] = Variable<double>(minStockThreshold.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('masterDrugId: $masterDrugId, ')
          ..write('localName: $localName, ')
          ..write('barcode: $barcode, ')
          ..write('minStockThreshold: $minStockThreshold, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductUnitsTableTable extends ProductUnitsTable
    with TableInfo<$ProductUnitsTableTable, ProductUnitDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductUnitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuid.v4(),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products_table (id)',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<String> pharmacyId = GeneratedColumn<String>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conversionFactorMeta = const VerificationMeta(
    'conversionFactor',
  );
  @override
  late final GeneratedColumn<double> conversionFactor = GeneratedColumn<double>(
    'conversion_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _costPriceMeta = const VerificationMeta(
    'costPrice',
  );
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
    'cost_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sellingPriceMeta = const VerificationMeta(
    'sellingPrice',
  );
  @override
  late final GeneratedColumn<double> sellingPrice = GeneratedColumn<double>(
    'selling_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBaseUnitMeta = const VerificationMeta(
    'isBaseUnit',
  );
  @override
  late final GeneratedColumn<bool> isBaseUnit = GeneratedColumn<bool>(
    'is_base_unit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_base_unit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    pharmacyId,
    unitName,
    conversionFactor,
    costPrice,
    sellingPrice,
    barcode,
    isBaseUnit,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_units_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductUnitDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
        _conversionFactorMeta,
        conversionFactor.isAcceptableOrUnknown(
          data['conversion_factor']!,
          _conversionFactorMeta,
        ),
      );
    }
    if (data.containsKey('cost_price')) {
      context.handle(
        _costPriceMeta,
        costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta),
      );
    }
    if (data.containsKey('selling_price')) {
      context.handle(
        _sellingPriceMeta,
        sellingPrice.isAcceptableOrUnknown(
          data['selling_price']!,
          _sellingPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sellingPriceMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('is_base_unit')) {
      context.handle(
        _isBaseUnitMeta,
        isBaseUnit.isAcceptableOrUnknown(
          data['is_base_unit']!,
          _isBaseUnitMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductUnitDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductUnitDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      unitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_name'],
      )!,
      conversionFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}conversion_factor'],
      )!,
      costPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price'],
      )!,
      sellingPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}selling_price'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      isBaseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_base_unit'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ProductUnitsTableTable createAlias(String alias) {
    return $ProductUnitsTableTable(attachedDatabase, alias);
  }
}

class ProductUnitDbModel extends DataClass
    implements Insertable<ProductUnitDbModel> {
  final String id;
  final String productId;
  final String pharmacyId;
  final String unitName;
  final double conversionFactor;
  final double costPrice;
  final double sellingPrice;
  final String? barcode;
  final bool isBaseUnit;
  final DateTime? updatedAt;
  const ProductUnitDbModel({
    required this.id,
    required this.productId,
    required this.pharmacyId,
    required this.unitName,
    required this.conversionFactor,
    required this.costPrice,
    required this.sellingPrice,
    this.barcode,
    required this.isBaseUnit,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['pharmacy_id'] = Variable<String>(pharmacyId);
    map['unit_name'] = Variable<String>(unitName);
    map['conversion_factor'] = Variable<double>(conversionFactor);
    map['cost_price'] = Variable<double>(costPrice);
    map['selling_price'] = Variable<double>(sellingPrice);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['is_base_unit'] = Variable<bool>(isBaseUnit);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProductUnitsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductUnitsTableCompanion(
      id: Value(id),
      productId: Value(productId),
      pharmacyId: Value(pharmacyId),
      unitName: Value(unitName),
      conversionFactor: Value(conversionFactor),
      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      isBaseUnit: Value(isBaseUnit),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ProductUnitDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductUnitDbModel(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      pharmacyId: serializer.fromJson<String>(json['pharmacyId']),
      unitName: serializer.fromJson<String>(json['unitName']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      sellingPrice: serializer.fromJson<double>(json['sellingPrice']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      isBaseUnit: serializer.fromJson<bool>(json['isBaseUnit']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'pharmacyId': serializer.toJson<String>(pharmacyId),
      'unitName': serializer.toJson<String>(unitName),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
      'costPrice': serializer.toJson<double>(costPrice),
      'sellingPrice': serializer.toJson<double>(sellingPrice),
      'barcode': serializer.toJson<String?>(barcode),
      'isBaseUnit': serializer.toJson<bool>(isBaseUnit),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ProductUnitDbModel copyWith({
    String? id,
    String? productId,
    String? pharmacyId,
    String? unitName,
    double? conversionFactor,
    double? costPrice,
    double? sellingPrice,
    Value<String?> barcode = const Value.absent(),
    bool? isBaseUnit,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => ProductUnitDbModel(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    unitName: unitName ?? this.unitName,
    conversionFactor: conversionFactor ?? this.conversionFactor,
    costPrice: costPrice ?? this.costPrice,
    sellingPrice: sellingPrice ?? this.sellingPrice,
    barcode: barcode.present ? barcode.value : this.barcode,
    isBaseUnit: isBaseUnit ?? this.isBaseUnit,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ProductUnitDbModel copyWithCompanion(ProductUnitsTableCompanion data) {
    return ProductUnitDbModel(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      conversionFactor: data.conversionFactor.present
          ? data.conversionFactor.value
          : this.conversionFactor,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      sellingPrice: data.sellingPrice.present
          ? data.sellingPrice.value
          : this.sellingPrice,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      isBaseUnit: data.isBaseUnit.present
          ? data.isBaseUnit.value
          : this.isBaseUnit,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductUnitDbModel(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('barcode: $barcode, ')
          ..write('isBaseUnit: $isBaseUnit, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    pharmacyId,
    unitName,
    conversionFactor,
    costPrice,
    sellingPrice,
    barcode,
    isBaseUnit,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductUnitDbModel &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.pharmacyId == this.pharmacyId &&
          other.unitName == this.unitName &&
          other.conversionFactor == this.conversionFactor &&
          other.costPrice == this.costPrice &&
          other.sellingPrice == this.sellingPrice &&
          other.barcode == this.barcode &&
          other.isBaseUnit == this.isBaseUnit &&
          other.updatedAt == this.updatedAt);
}

class ProductUnitsTableCompanion extends UpdateCompanion<ProductUnitDbModel> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> pharmacyId;
  final Value<String> unitName;
  final Value<double> conversionFactor;
  final Value<double> costPrice;
  final Value<double> sellingPrice;
  final Value<String?> barcode;
  final Value<bool> isBaseUnit;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ProductUnitsTableCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.conversionFactor = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.barcode = const Value.absent(),
    this.isBaseUnit = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductUnitsTableCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String pharmacyId,
    required String unitName,
    this.conversionFactor = const Value.absent(),
    this.costPrice = const Value.absent(),
    required double sellingPrice,
    this.barcode = const Value.absent(),
    this.isBaseUnit = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       pharmacyId = Value(pharmacyId),
       unitName = Value(unitName),
       sellingPrice = Value(sellingPrice);
  static Insertable<ProductUnitDbModel> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? pharmacyId,
    Expression<String>? unitName,
    Expression<double>? conversionFactor,
    Expression<double>? costPrice,
    Expression<double>? sellingPrice,
    Expression<String>? barcode,
    Expression<bool>? isBaseUnit,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (unitName != null) 'unit_name': unitName,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
      if (costPrice != null) 'cost_price': costPrice,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (barcode != null) 'barcode': barcode,
      if (isBaseUnit != null) 'is_base_unit': isBaseUnit,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductUnitsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? productId,
    Value<String>? pharmacyId,
    Value<String>? unitName,
    Value<double>? conversionFactor,
    Value<double>? costPrice,
    Value<double>? sellingPrice,
    Value<String?>? barcode,
    Value<bool>? isBaseUnit,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProductUnitsTableCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      unitName: unitName ?? this.unitName,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      costPrice: costPrice ?? this.costPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      barcode: barcode ?? this.barcode,
      isBaseUnit: isBaseUnit ?? this.isBaseUnit,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<String>(pharmacyId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (sellingPrice.present) {
      map['selling_price'] = Variable<double>(sellingPrice.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (isBaseUnit.present) {
      map['is_base_unit'] = Variable<bool>(isBaseUnit.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductUnitsTableCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('costPrice: $costPrice, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('barcode: $barcode, ')
          ..write('isBaseUnit: $isBaseUnit, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductBatchesTableTable extends ProductBatchesTable
    with TableInfo<$ProductBatchesTableTable, ProductBatchDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductBatchesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<String> pharmacyId = GeneratedColumn<String>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchNumberMeta = const VerificationMeta(
    'batchNumber',
  );
  @override
  late final GeneratedColumn<String> batchNumber = GeneratedColumn<String>(
    'batch_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiryDateMeta = const VerificationMeta(
    'expiryDate',
  );
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
    'expiry_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityBaseUnitMeta = const VerificationMeta(
    'quantityBaseUnit',
  );
  @override
  late final GeneratedColumn<double> quantityBaseUnit = GeneratedColumn<double>(
    'quantity_base_unit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    pharmacyId,
    batchNumber,
    expiryDate,
    quantityBaseUnit,
    purchasePrice,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_batches_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductBatchDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('batch_number')) {
      context.handle(
        _batchNumberMeta,
        batchNumber.isAcceptableOrUnknown(
          data['batch_number']!,
          _batchNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_batchNumberMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
        _expiryDateMeta,
        expiryDate.isAcceptableOrUnknown(data['expiry_date']!, _expiryDateMeta),
      );
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('quantity_base_unit')) {
      context.handle(
        _quantityBaseUnitMeta,
        quantityBaseUnit.isAcceptableOrUnknown(
          data['quantity_base_unit']!,
          _quantityBaseUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityBaseUnitMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductBatchDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductBatchDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      batchNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_number'],
      )!,
      expiryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expiry_date'],
      )!,
      quantityBaseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_base_unit'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_price'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ProductBatchesTableTable createAlias(String alias) {
    return $ProductBatchesTableTable(attachedDatabase, alias);
  }
}

class ProductBatchDbModel extends DataClass
    implements Insertable<ProductBatchDbModel> {
  final String id;
  final String productId;
  final String pharmacyId;
  final String batchNumber;
  final DateTime expiryDate;
  final double quantityBaseUnit;
  final double purchasePrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const ProductBatchDbModel({
    required this.id,
    required this.productId,
    required this.pharmacyId,
    required this.batchNumber,
    required this.expiryDate,
    required this.quantityBaseUnit,
    required this.purchasePrice,
    this.createdAt,
    this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['pharmacy_id'] = Variable<String>(pharmacyId);
    map['batch_number'] = Variable<String>(batchNumber);
    map['expiry_date'] = Variable<DateTime>(expiryDate);
    map['quantity_base_unit'] = Variable<double>(quantityBaseUnit);
    map['purchase_price'] = Variable<double>(purchasePrice);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ProductBatchesTableCompanion toCompanion(bool nullToAbsent) {
    return ProductBatchesTableCompanion(
      id: Value(id),
      productId: Value(productId),
      pharmacyId: Value(pharmacyId),
      batchNumber: Value(batchNumber),
      expiryDate: Value(expiryDate),
      quantityBaseUnit: Value(quantityBaseUnit),
      purchasePrice: Value(purchasePrice),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory ProductBatchDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductBatchDbModel(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      pharmacyId: serializer.fromJson<String>(json['pharmacyId']),
      batchNumber: serializer.fromJson<String>(json['batchNumber']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      quantityBaseUnit: serializer.fromJson<double>(json['quantityBaseUnit']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'pharmacyId': serializer.toJson<String>(pharmacyId),
      'batchNumber': serializer.toJson<String>(batchNumber),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'quantityBaseUnit': serializer.toJson<double>(quantityBaseUnit),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ProductBatchDbModel copyWith({
    String? id,
    String? productId,
    String? pharmacyId,
    String? batchNumber,
    DateTime? expiryDate,
    double? quantityBaseUnit,
    double? purchasePrice,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSynced,
  }) => ProductBatchDbModel(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    batchNumber: batchNumber ?? this.batchNumber,
    expiryDate: expiryDate ?? this.expiryDate,
    quantityBaseUnit: quantityBaseUnit ?? this.quantityBaseUnit,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  ProductBatchDbModel copyWithCompanion(ProductBatchesTableCompanion data) {
    return ProductBatchDbModel(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      batchNumber: data.batchNumber.present
          ? data.batchNumber.value
          : this.batchNumber,
      expiryDate: data.expiryDate.present
          ? data.expiryDate.value
          : this.expiryDate,
      quantityBaseUnit: data.quantityBaseUnit.present
          ? data.quantityBaseUnit.value
          : this.quantityBaseUnit,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductBatchDbModel(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('quantityBaseUnit: $quantityBaseUnit, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    pharmacyId,
    batchNumber,
    expiryDate,
    quantityBaseUnit,
    purchasePrice,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductBatchDbModel &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.pharmacyId == this.pharmacyId &&
          other.batchNumber == this.batchNumber &&
          other.expiryDate == this.expiryDate &&
          other.quantityBaseUnit == this.quantityBaseUnit &&
          other.purchasePrice == this.purchasePrice &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class ProductBatchesTableCompanion
    extends UpdateCompanion<ProductBatchDbModel> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> pharmacyId;
  final Value<String> batchNumber;
  final Value<DateTime> expiryDate;
  final Value<double> quantityBaseUnit;
  final Value<double> purchasePrice;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ProductBatchesTableCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.quantityBaseUnit = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductBatchesTableCompanion.insert({
    required String id,
    required String productId,
    required String pharmacyId,
    required String batchNumber,
    required DateTime expiryDate,
    required double quantityBaseUnit,
    this.purchasePrice = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       productId = Value(productId),
       pharmacyId = Value(pharmacyId),
       batchNumber = Value(batchNumber),
       expiryDate = Value(expiryDate),
       quantityBaseUnit = Value(quantityBaseUnit);
  static Insertable<ProductBatchDbModel> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? pharmacyId,
    Expression<String>? batchNumber,
    Expression<DateTime>? expiryDate,
    Expression<double>? quantityBaseUnit,
    Expression<double>? purchasePrice,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (quantityBaseUnit != null) 'quantity_base_unit': quantityBaseUnit,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductBatchesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? productId,
    Value<String>? pharmacyId,
    Value<String>? batchNumber,
    Value<DateTime>? expiryDate,
    Value<double>? quantityBaseUnit,
    Value<double>? purchasePrice,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ProductBatchesTableCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      batchNumber: batchNumber ?? this.batchNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      quantityBaseUnit: quantityBaseUnit ?? this.quantityBaseUnit,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<String>(pharmacyId.value);
    }
    if (batchNumber.present) {
      map['batch_number'] = Variable<String>(batchNumber.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (quantityBaseUnit.present) {
      map['quantity_base_unit'] = Variable<double>(quantityBaseUnit.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductBatchesTableCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('quantityBaseUnit: $quantityBaseUnit, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashSessionsTableTable extends CashSessionsTable
    with TableInfo<$CashSessionsTableTable, CashSessionDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalSalesMeta = const VerificationMeta(
    'totalSales',
  );
  @override
  late final GeneratedColumn<double> totalSales = GeneratedColumn<double>(
    'total_sales',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalReturnsMeta = const VerificationMeta(
    'totalReturns',
  );
  @override
  late final GeneratedColumn<double> totalReturns = GeneratedColumn<double>(
    'total_returns',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalExpensesMeta = const VerificationMeta(
    'totalExpenses',
  );
  @override
  late final GeneratedColumn<double> totalExpenses = GeneratedColumn<double>(
    'total_expenses',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    userId,
    startTime,
    endTime,
    openingBalance,
    totalSales,
    totalReturns,
    totalExpenses,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cash_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CashSessionDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('total_sales')) {
      context.handle(
        _totalSalesMeta,
        totalSales.isAcceptableOrUnknown(data['total_sales']!, _totalSalesMeta),
      );
    }
    if (data.containsKey('total_returns')) {
      context.handle(
        _totalReturnsMeta,
        totalReturns.isAcceptableOrUnknown(
          data['total_returns']!,
          _totalReturnsMeta,
        ),
      );
    }
    if (data.containsKey('total_expenses')) {
      context.handle(
        _totalExpensesMeta,
        totalExpenses.isAcceptableOrUnknown(
          data['total_expenses']!,
          _totalExpensesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashSessionDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashSessionDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}opening_balance'],
      )!,
      totalSales: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_sales'],
      )!,
      totalReturns: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_returns'],
      )!,
      totalExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_expenses'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $CashSessionsTableTable createAlias(String alias) {
    return $CashSessionsTableTable(attachedDatabase, alias);
  }
}

class CashSessionDbModel extends DataClass
    implements Insertable<CashSessionDbModel> {
  final int id;
  final int pharmacyId;
  final int userId;
  final DateTime startTime;
  final DateTime? endTime;
  final double openingBalance;
  final double totalSales;
  final double totalReturns;
  final double totalExpenses;
  final String status;
  const CashSessionDbModel({
    required this.id,
    required this.pharmacyId,
    required this.userId,
    required this.startTime,
    this.endTime,
    required this.openingBalance,
    required this.totalSales,
    required this.totalReturns,
    required this.totalExpenses,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['user_id'] = Variable<int>(userId);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['opening_balance'] = Variable<double>(openingBalance);
    map['total_sales'] = Variable<double>(totalSales);
    map['total_returns'] = Variable<double>(totalReturns);
    map['total_expenses'] = Variable<double>(totalExpenses);
    map['status'] = Variable<String>(status);
    return map;
  }

  CashSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return CashSessionsTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      userId: Value(userId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      openingBalance: Value(openingBalance),
      totalSales: Value(totalSales),
      totalReturns: Value(totalReturns),
      totalExpenses: Value(totalExpenses),
      status: Value(status),
    );
  }

  factory CashSessionDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashSessionDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      userId: serializer.fromJson<int>(json['userId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      totalSales: serializer.fromJson<double>(json['totalSales']),
      totalReturns: serializer.fromJson<double>(json['totalReturns']),
      totalExpenses: serializer.fromJson<double>(json['totalExpenses']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'userId': serializer.toJson<int>(userId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'totalSales': serializer.toJson<double>(totalSales),
      'totalReturns': serializer.toJson<double>(totalReturns),
      'totalExpenses': serializer.toJson<double>(totalExpenses),
      'status': serializer.toJson<String>(status),
    };
  }

  CashSessionDbModel copyWith({
    int? id,
    int? pharmacyId,
    int? userId,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    double? openingBalance,
    double? totalSales,
    double? totalReturns,
    double? totalExpenses,
    String? status,
  }) => CashSessionDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    userId: userId ?? this.userId,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    openingBalance: openingBalance ?? this.openingBalance,
    totalSales: totalSales ?? this.totalSales,
    totalReturns: totalReturns ?? this.totalReturns,
    totalExpenses: totalExpenses ?? this.totalExpenses,
    status: status ?? this.status,
  );
  CashSessionDbModel copyWithCompanion(CashSessionsTableCompanion data) {
    return CashSessionDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      userId: data.userId.present ? data.userId.value : this.userId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      totalSales: data.totalSales.present
          ? data.totalSales.value
          : this.totalSales,
      totalReturns: data.totalReturns.present
          ? data.totalReturns.value
          : this.totalReturns,
      totalExpenses: data.totalExpenses.present
          ? data.totalExpenses.value
          : this.totalExpenses,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashSessionDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('totalSales: $totalSales, ')
          ..write('totalReturns: $totalReturns, ')
          ..write('totalExpenses: $totalExpenses, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pharmacyId,
    userId,
    startTime,
    endTime,
    openingBalance,
    totalSales,
    totalReturns,
    totalExpenses,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashSessionDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.userId == this.userId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.openingBalance == this.openingBalance &&
          other.totalSales == this.totalSales &&
          other.totalReturns == this.totalReturns &&
          other.totalExpenses == this.totalExpenses &&
          other.status == this.status);
}

class CashSessionsTableCompanion extends UpdateCompanion<CashSessionDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<int> userId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<double> openingBalance;
  final Value<double> totalSales;
  final Value<double> totalReturns;
  final Value<double> totalExpenses;
  final Value<String> status;
  const CashSessionsTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.userId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.totalSales = const Value.absent(),
    this.totalReturns = const Value.absent(),
    this.totalExpenses = const Value.absent(),
    this.status = const Value.absent(),
  });
  CashSessionsTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required int userId,
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.totalSales = const Value.absent(),
    this.totalReturns = const Value.absent(),
    this.totalExpenses = const Value.absent(),
    required String status,
  }) : pharmacyId = Value(pharmacyId),
       userId = Value(userId),
       status = Value(status);
  static Insertable<CashSessionDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<int>? userId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<double>? openingBalance,
    Expression<double>? totalSales,
    Expression<double>? totalReturns,
    Expression<double>? totalExpenses,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (userId != null) 'user_id': userId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (totalSales != null) 'total_sales': totalSales,
      if (totalReturns != null) 'total_returns': totalReturns,
      if (totalExpenses != null) 'total_expenses': totalExpenses,
      if (status != null) 'status': status,
    });
  }

  CashSessionsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<int>? userId,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<double>? openingBalance,
    Value<double>? totalSales,
    Value<double>? totalReturns,
    Value<double>? totalExpenses,
    Value<String>? status,
  }) {
    return CashSessionsTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      openingBalance: openingBalance ?? this.openingBalance,
      totalSales: totalSales ?? this.totalSales,
      totalReturns: totalReturns ?? this.totalReturns,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (totalSales.present) {
      map['total_sales'] = Variable<double>(totalSales.value);
    }
    if (totalReturns.present) {
      map['total_returns'] = Variable<double>(totalReturns.value);
    }
    if (totalExpenses.present) {
      map['total_expenses'] = Variable<double>(totalExpenses.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('totalSales: $totalSales, ')
          ..write('totalReturns: $totalReturns, ')
          ..write('totalExpenses: $totalExpenses, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTableTable extends InvoicesTable
    with TableInfo<$InvoicesTableTable, InvoiceDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<String> pharmacyId = GeneratedColumn<String>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAmountMeta = const VerificationMeta(
    'paidAmount',
  );
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
    'paid_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountTotalMeta = const VerificationMeta(
    'discountTotal',
  );
  @override
  late final GeneratedColumn<double> discountTotal = GeneratedColumn<double>(
    'discount_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    sessionId,
    userId,
    customerId,
    totalAmount,
    paidAmount,
    discountTotal,
    paymentMethod,
    status,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
        _paidAmountMeta,
        paidAmount.isAcceptableOrUnknown(data['paid_amount']!, _paidAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
        _discountTotalMeta,
        discountTotal.isAcceptableOrUnknown(
          data['discount_total']!,
          _discountTotalMeta,
        ),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      paidAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid_amount'],
      )!,
      discountTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_total'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $InvoicesTableTable createAlias(String alias) {
    return $InvoicesTableTable(attachedDatabase, alias);
  }
}

class InvoiceDbModel extends DataClass implements Insertable<InvoiceDbModel> {
  final String id;
  final String pharmacyId;
  final String sessionId;
  final String userId;
  final String? customerId;
  final double totalAmount;
  final double paidAmount;
  final double discountTotal;
  final String paymentMethod;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const InvoiceDbModel({
    required this.id,
    required this.pharmacyId,
    required this.sessionId,
    required this.userId,
    this.customerId,
    required this.totalAmount,
    required this.paidAmount,
    required this.discountTotal,
    required this.paymentMethod,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pharmacy_id'] = Variable<String>(pharmacyId);
    map['session_id'] = Variable<String>(sessionId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<String>(customerId);
    }
    map['total_amount'] = Variable<double>(totalAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['discount_total'] = Variable<double>(discountTotal);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  InvoicesTableCompanion toCompanion(bool nullToAbsent) {
    return InvoicesTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      sessionId: Value(sessionId),
      userId: Value(userId),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      discountTotal: Value(discountTotal),
      paymentMethod: Value(paymentMethod),
      status: Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory InvoiceDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceDbModel(
      id: serializer.fromJson<String>(json['id']),
      pharmacyId: serializer.fromJson<String>(json['pharmacyId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      userId: serializer.fromJson<String>(json['userId']),
      customerId: serializer.fromJson<String?>(json['customerId']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pharmacyId': serializer.toJson<String>(pharmacyId),
      'sessionId': serializer.toJson<String>(sessionId),
      'userId': serializer.toJson<String>(userId),
      'customerId': serializer.toJson<String?>(customerId),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  InvoiceDbModel copyWith({
    String? id,
    String? pharmacyId,
    String? sessionId,
    String? userId,
    Value<String?> customerId = const Value.absent(),
    double? totalAmount,
    double? paidAmount,
    double? discountTotal,
    String? paymentMethod,
    String? status,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSynced,
  }) => InvoiceDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    sessionId: sessionId ?? this.sessionId,
    userId: userId ?? this.userId,
    customerId: customerId.present ? customerId.value : this.customerId,
    totalAmount: totalAmount ?? this.totalAmount,
    paidAmount: paidAmount ?? this.paidAmount,
    discountTotal: discountTotal ?? this.discountTotal,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    status: status ?? this.status,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  InvoiceDbModel copyWithCompanion(InvoicesTableCompanion data) {
    return InvoiceDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      userId: data.userId.present ? data.userId.value : this.userId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      paidAmount: data.paidAmount.present
          ? data.paidAmount.value
          : this.paidAmount,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pharmacyId,
    sessionId,
    userId,
    customerId,
    totalAmount,
    paidAmount,
    discountTotal,
    paymentMethod,
    status,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.sessionId == this.sessionId &&
          other.userId == this.userId &&
          other.customerId == this.customerId &&
          other.totalAmount == this.totalAmount &&
          other.paidAmount == this.paidAmount &&
          other.discountTotal == this.discountTotal &&
          other.paymentMethod == this.paymentMethod &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class InvoicesTableCompanion extends UpdateCompanion<InvoiceDbModel> {
  final Value<String> id;
  final Value<String> pharmacyId;
  final Value<String> sessionId;
  final Value<String> userId;
  final Value<String?> customerId;
  final Value<double> totalAmount;
  final Value<double> paidAmount;
  final Value<double> discountTotal;
  final Value<String> paymentMethod;
  final Value<String> status;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const InvoicesTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.userId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesTableCompanion.insert({
    required String id,
    required String pharmacyId,
    required String sessionId,
    required String userId,
    this.customerId = const Value.absent(),
    required double totalAmount,
    required double paidAmount,
    this.discountTotal = const Value.absent(),
    required String paymentMethod,
    required String status,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pharmacyId = Value(pharmacyId),
       sessionId = Value(sessionId),
       userId = Value(userId),
       totalAmount = Value(totalAmount),
       paidAmount = Value(paidAmount),
       paymentMethod = Value(paymentMethod),
       status = Value(status);
  static Insertable<InvoiceDbModel> custom({
    Expression<String>? id,
    Expression<String>? pharmacyId,
    Expression<String>? sessionId,
    Expression<String>? userId,
    Expression<String>? customerId,
    Expression<double>? totalAmount,
    Expression<double>? paidAmount,
    Expression<double>? discountTotal,
    Expression<String>? paymentMethod,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (sessionId != null) 'session_id': sessionId,
      if (userId != null) 'user_id': userId,
      if (customerId != null) 'customer_id': customerId,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? pharmacyId,
    Value<String>? sessionId,
    Value<String>? userId,
    Value<String?>? customerId,
    Value<double>? totalAmount,
    Value<double>? paidAmount,
    Value<double>? discountTotal,
    Value<String>? paymentMethod,
    Value<String>? status,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return InvoicesTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      discountTotal: discountTotal ?? this.discountTotal,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<String>(pharmacyId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<double>(discountTotal.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoiceItemsTableTable extends InvoiceItemsTable
    with TableInfo<$InvoiceItemsTableTable, InvoiceItemDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_units_table (id)',
    ),
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalUnitPriceMeta = const VerificationMeta(
    'originalUnitPrice',
  );
  @override
  late final GeneratedColumn<double> originalUnitPrice =
      GeneratedColumn<double>(
        'original_unit_price',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _appliedDiscountMeta = const VerificationMeta(
    'appliedDiscount',
  );
  @override
  late final GeneratedColumn<double> appliedDiscount = GeneratedColumn<double>(
    'applied_discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _appliedPremiumMeta = const VerificationMeta(
    'appliedPremium',
  );
  @override
  late final GeneratedColumn<double> appliedPremium = GeneratedColumn<double>(
    'applied_premium',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _finalUnitPriceMeta = const VerificationMeta(
    'finalUnitPrice',
  );
  @override
  late final GeneratedColumn<double> finalUnitPrice = GeneratedColumn<double>(
    'final_unit_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceModifiedByMeta = const VerificationMeta(
    'priceModifiedBy',
  );
  @override
  late final GeneratedColumn<String> priceModifiedBy = GeneratedColumn<String>(
    'price_modified_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productId,
    unitId,
    batchId,
    quantity,
    originalUnitPrice,
    appliedDiscount,
    appliedPremium,
    finalUnitPrice,
    priceModifiedBy,
    subtotal,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceItemDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('original_unit_price')) {
      context.handle(
        _originalUnitPriceMeta,
        originalUnitPrice.isAcceptableOrUnknown(
          data['original_unit_price']!,
          _originalUnitPriceMeta,
        ),
      );
    }
    if (data.containsKey('applied_discount')) {
      context.handle(
        _appliedDiscountMeta,
        appliedDiscount.isAcceptableOrUnknown(
          data['applied_discount']!,
          _appliedDiscountMeta,
        ),
      );
    }
    if (data.containsKey('applied_premium')) {
      context.handle(
        _appliedPremiumMeta,
        appliedPremium.isAcceptableOrUnknown(
          data['applied_premium']!,
          _appliedPremiumMeta,
        ),
      );
    }
    if (data.containsKey('final_unit_price')) {
      context.handle(
        _finalUnitPriceMeta,
        finalUnitPrice.isAcceptableOrUnknown(
          data['final_unit_price']!,
          _finalUnitPriceMeta,
        ),
      );
    }
    if (data.containsKey('price_modified_by')) {
      context.handle(
        _priceModifiedByMeta,
        priceModifiedBy.isAcceptableOrUnknown(
          data['price_modified_by']!,
          _priceModifiedByMeta,
        ),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceItemDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceItemDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      originalUnitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}original_unit_price'],
      ),
      appliedDiscount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}applied_discount'],
      )!,
      appliedPremium: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}applied_premium'],
      )!,
      finalUnitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_unit_price'],
      ),
      priceModifiedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price_modified_by'],
      ),
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $InvoiceItemsTableTable createAlias(String alias) {
    return $InvoiceItemsTableTable(attachedDatabase, alias);
  }
}

class InvoiceItemDbModel extends DataClass
    implements Insertable<InvoiceItemDbModel> {
  final String id;
  final String invoiceId;
  final String productId;
  final String unitId;
  final String? batchId;
  final double quantity;
  final double? originalUnitPrice;
  final double appliedDiscount;
  final double appliedPremium;
  final double? finalUnitPrice;
  final String? priceModifiedBy;
  final double subtotal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  const InvoiceItemDbModel({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.unitId,
    this.batchId,
    required this.quantity,
    this.originalUnitPrice,
    required this.appliedDiscount,
    required this.appliedPremium,
    this.finalUnitPrice,
    this.priceModifiedBy,
    required this.subtotal,
    this.createdAt,
    this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['product_id'] = Variable<String>(productId);
    map['unit_id'] = Variable<String>(unitId);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || originalUnitPrice != null) {
      map['original_unit_price'] = Variable<double>(originalUnitPrice);
    }
    map['applied_discount'] = Variable<double>(appliedDiscount);
    map['applied_premium'] = Variable<double>(appliedPremium);
    if (!nullToAbsent || finalUnitPrice != null) {
      map['final_unit_price'] = Variable<double>(finalUnitPrice);
    }
    if (!nullToAbsent || priceModifiedBy != null) {
      map['price_modified_by'] = Variable<String>(priceModifiedBy);
    }
    map['subtotal'] = Variable<double>(subtotal);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  InvoiceItemsTableCompanion toCompanion(bool nullToAbsent) {
    return InvoiceItemsTableCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: Value(productId),
      unitId: Value(unitId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantity: Value(quantity),
      originalUnitPrice: originalUnitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(originalUnitPrice),
      appliedDiscount: Value(appliedDiscount),
      appliedPremium: Value(appliedPremium),
      finalUnitPrice: finalUnitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(finalUnitPrice),
      priceModifiedBy: priceModifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(priceModifiedBy),
      subtotal: Value(subtotal),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory InvoiceItemDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceItemDbModel(
      id: serializer.fromJson<String>(json['id']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      productId: serializer.fromJson<String>(json['productId']),
      unitId: serializer.fromJson<String>(json['unitId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      originalUnitPrice: serializer.fromJson<double?>(
        json['originalUnitPrice'],
      ),
      appliedDiscount: serializer.fromJson<double>(json['appliedDiscount']),
      appliedPremium: serializer.fromJson<double>(json['appliedPremium']),
      finalUnitPrice: serializer.fromJson<double?>(json['finalUnitPrice']),
      priceModifiedBy: serializer.fromJson<String?>(json['priceModifiedBy']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'productId': serializer.toJson<String>(productId),
      'unitId': serializer.toJson<String>(unitId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantity': serializer.toJson<double>(quantity),
      'originalUnitPrice': serializer.toJson<double?>(originalUnitPrice),
      'appliedDiscount': serializer.toJson<double>(appliedDiscount),
      'appliedPremium': serializer.toJson<double>(appliedPremium),
      'finalUnitPrice': serializer.toJson<double?>(finalUnitPrice),
      'priceModifiedBy': serializer.toJson<String?>(priceModifiedBy),
      'subtotal': serializer.toJson<double>(subtotal),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  InvoiceItemDbModel copyWith({
    String? id,
    String? invoiceId,
    String? productId,
    String? unitId,
    Value<String?> batchId = const Value.absent(),
    double? quantity,
    Value<double?> originalUnitPrice = const Value.absent(),
    double? appliedDiscount,
    double? appliedPremium,
    Value<double?> finalUnitPrice = const Value.absent(),
    Value<String?> priceModifiedBy = const Value.absent(),
    double? subtotal,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    bool? isSynced,
  }) => InvoiceItemDbModel(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productId: productId ?? this.productId,
    unitId: unitId ?? this.unitId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantity: quantity ?? this.quantity,
    originalUnitPrice: originalUnitPrice.present
        ? originalUnitPrice.value
        : this.originalUnitPrice,
    appliedDiscount: appliedDiscount ?? this.appliedDiscount,
    appliedPremium: appliedPremium ?? this.appliedPremium,
    finalUnitPrice: finalUnitPrice.present
        ? finalUnitPrice.value
        : this.finalUnitPrice,
    priceModifiedBy: priceModifiedBy.present
        ? priceModifiedBy.value
        : this.priceModifiedBy,
    subtotal: subtotal ?? this.subtotal,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  InvoiceItemDbModel copyWithCompanion(InvoiceItemsTableCompanion data) {
    return InvoiceItemDbModel(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      originalUnitPrice: data.originalUnitPrice.present
          ? data.originalUnitPrice.value
          : this.originalUnitPrice,
      appliedDiscount: data.appliedDiscount.present
          ? data.appliedDiscount.value
          : this.appliedDiscount,
      appliedPremium: data.appliedPremium.present
          ? data.appliedPremium.value
          : this.appliedPremium,
      finalUnitPrice: data.finalUnitPrice.present
          ? data.finalUnitPrice.value
          : this.finalUnitPrice,
      priceModifiedBy: data.priceModifiedBy.present
          ? data.priceModifiedBy.value
          : this.priceModifiedBy,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItemDbModel(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('originalUnitPrice: $originalUnitPrice, ')
          ..write('appliedDiscount: $appliedDiscount, ')
          ..write('appliedPremium: $appliedPremium, ')
          ..write('finalUnitPrice: $finalUnitPrice, ')
          ..write('priceModifiedBy: $priceModifiedBy, ')
          ..write('subtotal: $subtotal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productId,
    unitId,
    batchId,
    quantity,
    originalUnitPrice,
    appliedDiscount,
    appliedPremium,
    finalUnitPrice,
    priceModifiedBy,
    subtotal,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceItemDbModel &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.unitId == this.unitId &&
          other.batchId == this.batchId &&
          other.quantity == this.quantity &&
          other.originalUnitPrice == this.originalUnitPrice &&
          other.appliedDiscount == this.appliedDiscount &&
          other.appliedPremium == this.appliedPremium &&
          other.finalUnitPrice == this.finalUnitPrice &&
          other.priceModifiedBy == this.priceModifiedBy &&
          other.subtotal == this.subtotal &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class InvoiceItemsTableCompanion extends UpdateCompanion<InvoiceItemDbModel> {
  final Value<String> id;
  final Value<String> invoiceId;
  final Value<String> productId;
  final Value<String> unitId;
  final Value<String?> batchId;
  final Value<double> quantity;
  final Value<double?> originalUnitPrice;
  final Value<double> appliedDiscount;
  final Value<double> appliedPremium;
  final Value<double?> finalUnitPrice;
  final Value<String?> priceModifiedBy;
  final Value<double> subtotal;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const InvoiceItemsTableCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.originalUnitPrice = const Value.absent(),
    this.appliedDiscount = const Value.absent(),
    this.appliedPremium = const Value.absent(),
    this.finalUnitPrice = const Value.absent(),
    this.priceModifiedBy = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoiceItemsTableCompanion.insert({
    required String id,
    required String invoiceId,
    required String productId,
    required String unitId,
    this.batchId = const Value.absent(),
    required double quantity,
    this.originalUnitPrice = const Value.absent(),
    this.appliedDiscount = const Value.absent(),
    this.appliedPremium = const Value.absent(),
    this.finalUnitPrice = const Value.absent(),
    this.priceModifiedBy = const Value.absent(),
    required double subtotal,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       invoiceId = Value(invoiceId),
       productId = Value(productId),
       unitId = Value(unitId),
       quantity = Value(quantity),
       subtotal = Value(subtotal);
  static Insertable<InvoiceItemDbModel> custom({
    Expression<String>? id,
    Expression<String>? invoiceId,
    Expression<String>? productId,
    Expression<String>? unitId,
    Expression<String>? batchId,
    Expression<double>? quantity,
    Expression<double>? originalUnitPrice,
    Expression<double>? appliedDiscount,
    Expression<double>? appliedPremium,
    Expression<double>? finalUnitPrice,
    Expression<String>? priceModifiedBy,
    Expression<double>? subtotal,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (unitId != null) 'unit_id': unitId,
      if (batchId != null) 'batch_id': batchId,
      if (quantity != null) 'quantity': quantity,
      if (originalUnitPrice != null) 'original_unit_price': originalUnitPrice,
      if (appliedDiscount != null) 'applied_discount': appliedDiscount,
      if (appliedPremium != null) 'applied_premium': appliedPremium,
      if (finalUnitPrice != null) 'final_unit_price': finalUnitPrice,
      if (priceModifiedBy != null) 'price_modified_by': priceModifiedBy,
      if (subtotal != null) 'subtotal': subtotal,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoiceItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? invoiceId,
    Value<String>? productId,
    Value<String>? unitId,
    Value<String?>? batchId,
    Value<double>? quantity,
    Value<double?>? originalUnitPrice,
    Value<double>? appliedDiscount,
    Value<double>? appliedPremium,
    Value<double?>? finalUnitPrice,
    Value<String?>? priceModifiedBy,
    Value<double>? subtotal,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return InvoiceItemsTableCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      unitId: unitId ?? this.unitId,
      batchId: batchId ?? this.batchId,
      quantity: quantity ?? this.quantity,
      originalUnitPrice: originalUnitPrice ?? this.originalUnitPrice,
      appliedDiscount: appliedDiscount ?? this.appliedDiscount,
      appliedPremium: appliedPremium ?? this.appliedPremium,
      finalUnitPrice: finalUnitPrice ?? this.finalUnitPrice,
      priceModifiedBy: priceModifiedBy ?? this.priceModifiedBy,
      subtotal: subtotal ?? this.subtotal,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (originalUnitPrice.present) {
      map['original_unit_price'] = Variable<double>(originalUnitPrice.value);
    }
    if (appliedDiscount.present) {
      map['applied_discount'] = Variable<double>(appliedDiscount.value);
    }
    if (appliedPremium.present) {
      map['applied_premium'] = Variable<double>(appliedPremium.value);
    }
    if (finalUnitPrice.present) {
      map['final_unit_price'] = Variable<double>(finalUnitPrice.value);
    }
    if (priceModifiedBy.present) {
      map['price_modified_by'] = Variable<String>(priceModifiedBy.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('originalUnitPrice: $originalUnitPrice, ')
          ..write('appliedDiscount: $appliedDiscount, ')
          ..write('appliedPremium: $appliedPremium, ')
          ..write('finalUnitPrice: $finalUnitPrice, ')
          ..write('priceModifiedBy: $priceModifiedBy, ')
          ..write('subtotal: $subtotal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReturnsTableTable extends ReturnsTable
    with TableInfo<$ReturnsTableTable, ReturnDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pharmacyIdMeta = const VerificationMeta(
    'pharmacyId',
  );
  @override
  late final GeneratedColumn<int> pharmacyId = GeneratedColumn<int>(
    'pharmacy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalRefundMeta = const VerificationMeta(
    'totalRefund',
  );
  @override
  late final GeneratedColumn<double> totalRefund = GeneratedColumn<double>(
    'total_refund',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _returnDateMeta = const VerificationMeta(
    'returnDate',
  );
  @override
  late final GeneratedColumn<DateTime> returnDate = GeneratedColumn<DateTime>(
    'return_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pharmacyId,
    invoiceId,
    userId,
    totalRefund,
    returnDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'returns_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReturnDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pharmacy_id')) {
      context.handle(
        _pharmacyIdMeta,
        pharmacyId.isAcceptableOrUnknown(data['pharmacy_id']!, _pharmacyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pharmacyIdMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('total_refund')) {
      context.handle(
        _totalRefundMeta,
        totalRefund.isAcceptableOrUnknown(
          data['total_refund']!,
          _totalRefundMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalRefundMeta);
    }
    if (data.containsKey('return_date')) {
      context.handle(
        _returnDateMeta,
        returnDate.isAcceptableOrUnknown(data['return_date']!, _returnDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pharmacyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pharmacy_id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      totalRefund: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_refund'],
      )!,
      returnDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}return_date'],
      )!,
    );
  }

  @override
  $ReturnsTableTable createAlias(String alias) {
    return $ReturnsTableTable(attachedDatabase, alias);
  }
}

class ReturnDbModel extends DataClass implements Insertable<ReturnDbModel> {
  final int id;
  final int pharmacyId;
  final int invoiceId;
  final int userId;
  final double totalRefund;
  final DateTime returnDate;
  const ReturnDbModel({
    required this.id,
    required this.pharmacyId,
    required this.invoiceId,
    required this.userId,
    required this.totalRefund,
    required this.returnDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pharmacy_id'] = Variable<int>(pharmacyId);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['user_id'] = Variable<int>(userId);
    map['total_refund'] = Variable<double>(totalRefund);
    map['return_date'] = Variable<DateTime>(returnDate);
    return map;
  }

  ReturnsTableCompanion toCompanion(bool nullToAbsent) {
    return ReturnsTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      invoiceId: Value(invoiceId),
      userId: Value(userId),
      totalRefund: Value(totalRefund),
      returnDate: Value(returnDate),
    );
  }

  factory ReturnDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnDbModel(
      id: serializer.fromJson<int>(json['id']),
      pharmacyId: serializer.fromJson<int>(json['pharmacyId']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      userId: serializer.fromJson<int>(json['userId']),
      totalRefund: serializer.fromJson<double>(json['totalRefund']),
      returnDate: serializer.fromJson<DateTime>(json['returnDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pharmacyId': serializer.toJson<int>(pharmacyId),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'userId': serializer.toJson<int>(userId),
      'totalRefund': serializer.toJson<double>(totalRefund),
      'returnDate': serializer.toJson<DateTime>(returnDate),
    };
  }

  ReturnDbModel copyWith({
    int? id,
    int? pharmacyId,
    int? invoiceId,
    int? userId,
    double? totalRefund,
    DateTime? returnDate,
  }) => ReturnDbModel(
    id: id ?? this.id,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    invoiceId: invoiceId ?? this.invoiceId,
    userId: userId ?? this.userId,
    totalRefund: totalRefund ?? this.totalRefund,
    returnDate: returnDate ?? this.returnDate,
  );
  ReturnDbModel copyWithCompanion(ReturnsTableCompanion data) {
    return ReturnDbModel(
      id: data.id.present ? data.id.value : this.id,
      pharmacyId: data.pharmacyId.present
          ? data.pharmacyId.value
          : this.pharmacyId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      totalRefund: data.totalRefund.present
          ? data.totalRefund.value
          : this.totalRefund,
      returnDate: data.returnDate.present
          ? data.returnDate.value
          : this.returnDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnDbModel(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('userId: $userId, ')
          ..write('totalRefund: $totalRefund, ')
          ..write('returnDate: $returnDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pharmacyId, invoiceId, userId, totalRefund, returnDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnDbModel &&
          other.id == this.id &&
          other.pharmacyId == this.pharmacyId &&
          other.invoiceId == this.invoiceId &&
          other.userId == this.userId &&
          other.totalRefund == this.totalRefund &&
          other.returnDate == this.returnDate);
}

class ReturnsTableCompanion extends UpdateCompanion<ReturnDbModel> {
  final Value<int> id;
  final Value<int> pharmacyId;
  final Value<int> invoiceId;
  final Value<int> userId;
  final Value<double> totalRefund;
  final Value<DateTime> returnDate;
  const ReturnsTableCompanion({
    this.id = const Value.absent(),
    this.pharmacyId = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.userId = const Value.absent(),
    this.totalRefund = const Value.absent(),
    this.returnDate = const Value.absent(),
  });
  ReturnsTableCompanion.insert({
    this.id = const Value.absent(),
    required int pharmacyId,
    required int invoiceId,
    required int userId,
    required double totalRefund,
    this.returnDate = const Value.absent(),
  }) : pharmacyId = Value(pharmacyId),
       invoiceId = Value(invoiceId),
       userId = Value(userId),
       totalRefund = Value(totalRefund);
  static Insertable<ReturnDbModel> custom({
    Expression<int>? id,
    Expression<int>? pharmacyId,
    Expression<int>? invoiceId,
    Expression<int>? userId,
    Expression<double>? totalRefund,
    Expression<DateTime>? returnDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pharmacyId != null) 'pharmacy_id': pharmacyId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (userId != null) 'user_id': userId,
      if (totalRefund != null) 'total_refund': totalRefund,
      if (returnDate != null) 'return_date': returnDate,
    });
  }

  ReturnsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pharmacyId,
    Value<int>? invoiceId,
    Value<int>? userId,
    Value<double>? totalRefund,
    Value<DateTime>? returnDate,
  }) {
    return ReturnsTableCompanion(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      invoiceId: invoiceId ?? this.invoiceId,
      userId: userId ?? this.userId,
      totalRefund: totalRefund ?? this.totalRefund,
      returnDate: returnDate ?? this.returnDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pharmacyId.present) {
      map['pharmacy_id'] = Variable<int>(pharmacyId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (totalRefund.present) {
      map['total_refund'] = Variable<double>(totalRefund.value);
    }
    if (returnDate.present) {
      map['return_date'] = Variable<DateTime>(returnDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnsTableCompanion(')
          ..write('id: $id, ')
          ..write('pharmacyId: $pharmacyId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('userId: $userId, ')
          ..write('totalRefund: $totalRefund, ')
          ..write('returnDate: $returnDate')
          ..write(')'))
        .toString();
  }
}

class $ReturnItemsTableTable extends ReturnItemsTable
    with TableInfo<$ReturnItemsTableTable, ReturnItemDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _returnIdMeta = const VerificationMeta(
    'returnId',
  );
  @override
  late final GeneratedColumn<int> returnId = GeneratedColumn<int>(
    'return_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceItemIdMeta = const VerificationMeta(
    'invoiceItemId',
  );
  @override
  late final GeneratedColumn<int> invoiceItemId = GeneratedColumn<int>(
    'invoice_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refundAmountMeta = const VerificationMeta(
    'refundAmount',
  );
  @override
  late final GeneratedColumn<double> refundAmount = GeneratedColumn<double>(
    'refund_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnId,
    invoiceItemId,
    quantity,
    refundAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'return_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReturnItemDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('return_id')) {
      context.handle(
        _returnIdMeta,
        returnId.isAcceptableOrUnknown(data['return_id']!, _returnIdMeta),
      );
    } else if (isInserting) {
      context.missing(_returnIdMeta);
    }
    if (data.containsKey('invoice_item_id')) {
      context.handle(
        _invoiceItemIdMeta,
        invoiceItemId.isAcceptableOrUnknown(
          data['invoice_item_id']!,
          _invoiceItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('refund_amount')) {
      context.handle(
        _refundAmountMeta,
        refundAmount.isAcceptableOrUnknown(
          data['refund_amount']!,
          _refundAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_refundAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnItemDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnItemDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      returnId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}return_id'],
      )!,
      invoiceItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_item_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      refundAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}refund_amount'],
      )!,
    );
  }

  @override
  $ReturnItemsTableTable createAlias(String alias) {
    return $ReturnItemsTableTable(attachedDatabase, alias);
  }
}

class ReturnItemDbModel extends DataClass
    implements Insertable<ReturnItemDbModel> {
  final int id;
  final int returnId;
  final int invoiceItemId;
  final double quantity;
  final double refundAmount;
  const ReturnItemDbModel({
    required this.id,
    required this.returnId,
    required this.invoiceItemId,
    required this.quantity,
    required this.refundAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['return_id'] = Variable<int>(returnId);
    map['invoice_item_id'] = Variable<int>(invoiceItemId);
    map['quantity'] = Variable<double>(quantity);
    map['refund_amount'] = Variable<double>(refundAmount);
    return map;
  }

  ReturnItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ReturnItemsTableCompanion(
      id: Value(id),
      returnId: Value(returnId),
      invoiceItemId: Value(invoiceItemId),
      quantity: Value(quantity),
      refundAmount: Value(refundAmount),
    );
  }

  factory ReturnItemDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnItemDbModel(
      id: serializer.fromJson<int>(json['id']),
      returnId: serializer.fromJson<int>(json['returnId']),
      invoiceItemId: serializer.fromJson<int>(json['invoiceItemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      refundAmount: serializer.fromJson<double>(json['refundAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'returnId': serializer.toJson<int>(returnId),
      'invoiceItemId': serializer.toJson<int>(invoiceItemId),
      'quantity': serializer.toJson<double>(quantity),
      'refundAmount': serializer.toJson<double>(refundAmount),
    };
  }

  ReturnItemDbModel copyWith({
    int? id,
    int? returnId,
    int? invoiceItemId,
    double? quantity,
    double? refundAmount,
  }) => ReturnItemDbModel(
    id: id ?? this.id,
    returnId: returnId ?? this.returnId,
    invoiceItemId: invoiceItemId ?? this.invoiceItemId,
    quantity: quantity ?? this.quantity,
    refundAmount: refundAmount ?? this.refundAmount,
  );
  ReturnItemDbModel copyWithCompanion(ReturnItemsTableCompanion data) {
    return ReturnItemDbModel(
      id: data.id.present ? data.id.value : this.id,
      returnId: data.returnId.present ? data.returnId.value : this.returnId,
      invoiceItemId: data.invoiceItemId.present
          ? data.invoiceItemId.value
          : this.invoiceItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      refundAmount: data.refundAmount.present
          ? data.refundAmount.value
          : this.refundAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnItemDbModel(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('invoiceItemId: $invoiceItemId, ')
          ..write('quantity: $quantity, ')
          ..write('refundAmount: $refundAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, returnId, invoiceItemId, quantity, refundAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnItemDbModel &&
          other.id == this.id &&
          other.returnId == this.returnId &&
          other.invoiceItemId == this.invoiceItemId &&
          other.quantity == this.quantity &&
          other.refundAmount == this.refundAmount);
}

class ReturnItemsTableCompanion extends UpdateCompanion<ReturnItemDbModel> {
  final Value<int> id;
  final Value<int> returnId;
  final Value<int> invoiceItemId;
  final Value<double> quantity;
  final Value<double> refundAmount;
  const ReturnItemsTableCompanion({
    this.id = const Value.absent(),
    this.returnId = const Value.absent(),
    this.invoiceItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.refundAmount = const Value.absent(),
  });
  ReturnItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int returnId,
    required int invoiceItemId,
    required double quantity,
    required double refundAmount,
  }) : returnId = Value(returnId),
       invoiceItemId = Value(invoiceItemId),
       quantity = Value(quantity),
       refundAmount = Value(refundAmount);
  static Insertable<ReturnItemDbModel> custom({
    Expression<int>? id,
    Expression<int>? returnId,
    Expression<int>? invoiceItemId,
    Expression<double>? quantity,
    Expression<double>? refundAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnId != null) 'return_id': returnId,
      if (invoiceItemId != null) 'invoice_item_id': invoiceItemId,
      if (quantity != null) 'quantity': quantity,
      if (refundAmount != null) 'refund_amount': refundAmount,
    });
  }

  ReturnItemsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? returnId,
    Value<int>? invoiceItemId,
    Value<double>? quantity,
    Value<double>? refundAmount,
  }) {
    return ReturnItemsTableCompanion(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      invoiceItemId: invoiceItemId ?? this.invoiceItemId,
      quantity: quantity ?? this.quantity,
      refundAmount: refundAmount ?? this.refundAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (returnId.present) {
      map['return_id'] = Variable<int>(returnId.value);
    }
    if (invoiceItemId.present) {
      map['invoice_item_id'] = Variable<int>(invoiceItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (refundAmount.present) {
      map['refund_amount'] = Variable<double>(refundAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('invoiceItemId: $invoiceItemId, ')
          ..write('quantity: $quantity, ')
          ..write('refundAmount: $refundAmount')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTableTable extends AuditLogsTable
    with TableInfo<$AuditLogsTableTable, AuditLogDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTableMeta = const VerificationMeta(
    'targetTable',
  );
  @override
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
    'target_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _oldValueMeta = const VerificationMeta(
    'oldValue',
  );
  @override
  late final GeneratedColumn<String> oldValue = GeneratedColumn<String>(
    'old_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newValueMeta = const VerificationMeta(
    'newValue',
  );
  @override
  late final GeneratedColumn<String> newValue = GeneratedColumn<String>(
    'new_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    action,
    targetTable,
    oldValue,
    newValue,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('target_table')) {
      context.handle(
        _targetTableMeta,
        targetTable.isAcceptableOrUnknown(
          data['target_table']!,
          _targetTableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('old_value')) {
      context.handle(
        _oldValueMeta,
        oldValue.isAcceptableOrUnknown(data['old_value']!, _oldValueMeta),
      );
    }
    if (data.containsKey('new_value')) {
      context.handle(
        _newValueMeta,
        newValue.isAcceptableOrUnknown(data['new_value']!, _newValueMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      targetTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_table'],
      )!,
      oldValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_value'],
      ),
      newValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_value'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditLogsTableTable createAlias(String alias) {
    return $AuditLogsTableTable(attachedDatabase, alias);
  }
}

class AuditLogDbModel extends DataClass implements Insertable<AuditLogDbModel> {
  final int id;
  final int? userId;
  final String action;
  final String targetTable;
  final String? oldValue;
  final String? newValue;
  final DateTime createdAt;
  const AuditLogDbModel({
    required this.id,
    this.userId,
    required this.action,
    required this.targetTable,
    this.oldValue,
    this.newValue,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['action'] = Variable<String>(action);
    map['target_table'] = Variable<String>(targetTable);
    if (!nullToAbsent || oldValue != null) {
      map['old_value'] = Variable<String>(oldValue);
    }
    if (!nullToAbsent || newValue != null) {
      map['new_value'] = Variable<String>(newValue);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditLogsTableCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsTableCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      action: Value(action),
      targetTable: Value(targetTable),
      oldValue: oldValue == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValue),
      newValue: newValue == null && nullToAbsent
          ? const Value.absent()
          : Value(newValue),
      createdAt: Value(createdAt),
    );
  }

  factory AuditLogDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogDbModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      action: serializer.fromJson<String>(json['action']),
      targetTable: serializer.fromJson<String>(json['targetTable']),
      oldValue: serializer.fromJson<String?>(json['oldValue']),
      newValue: serializer.fromJson<String?>(json['newValue']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'action': serializer.toJson<String>(action),
      'targetTable': serializer.toJson<String>(targetTable),
      'oldValue': serializer.toJson<String?>(oldValue),
      'newValue': serializer.toJson<String?>(newValue),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditLogDbModel copyWith({
    int? id,
    Value<int?> userId = const Value.absent(),
    String? action,
    String? targetTable,
    Value<String?> oldValue = const Value.absent(),
    Value<String?> newValue = const Value.absent(),
    DateTime? createdAt,
  }) => AuditLogDbModel(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    action: action ?? this.action,
    targetTable: targetTable ?? this.targetTable,
    oldValue: oldValue.present ? oldValue.value : this.oldValue,
    newValue: newValue.present ? newValue.value : this.newValue,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditLogDbModel copyWithCompanion(AuditLogsTableCompanion data) {
    return AuditLogDbModel(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      action: data.action.present ? data.action.value : this.action,
      targetTable: data.targetTable.present
          ? data.targetTable.value
          : this.targetTable,
      oldValue: data.oldValue.present ? data.oldValue.value : this.oldValue,
      newValue: data.newValue.present ? data.newValue.value : this.newValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogDbModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('targetTable: $targetTable, ')
          ..write('oldValue: $oldValue, ')
          ..write('newValue: $newValue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    action,
    targetTable,
    oldValue,
    newValue,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogDbModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.action == this.action &&
          other.targetTable == this.targetTable &&
          other.oldValue == this.oldValue &&
          other.newValue == this.newValue &&
          other.createdAt == this.createdAt);
}

class AuditLogsTableCompanion extends UpdateCompanion<AuditLogDbModel> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String> action;
  final Value<String> targetTable;
  final Value<String?> oldValue;
  final Value<String?> newValue;
  final Value<DateTime> createdAt;
  const AuditLogsTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.action = const Value.absent(),
    this.targetTable = const Value.absent(),
    this.oldValue = const Value.absent(),
    this.newValue = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuditLogsTableCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String action,
    required String targetTable,
    this.oldValue = const Value.absent(),
    this.newValue = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : action = Value(action),
       targetTable = Value(targetTable);
  static Insertable<AuditLogDbModel> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? action,
    Expression<String>? targetTable,
    Expression<String>? oldValue,
    Expression<String>? newValue,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (action != null) 'action': action,
      if (targetTable != null) 'target_table': targetTable,
      if (oldValue != null) 'old_value': oldValue,
      if (newValue != null) 'new_value': newValue,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuditLogsTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? userId,
    Value<String>? action,
    Value<String>? targetTable,
    Value<String?>? oldValue,
    Value<String?>? newValue,
    Value<DateTime>? createdAt,
  }) {
    return AuditLogsTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      action: action ?? this.action,
      targetTable: targetTable ?? this.targetTable,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (targetTable.present) {
      map['target_table'] = Variable<String>(targetTable.value);
    }
    if (oldValue.present) {
      map['old_value'] = Variable<String>(oldValue.value);
    }
    if (newValue.present) {
      map['new_value'] = Variable<String>(newValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('targetTable: $targetTable, ')
          ..write('oldValue: $oldValue, ')
          ..write('newValue: $newValue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTableTable extends PaymentsTable
    with TableInfo<$PaymentsTableTable, PaymentDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    customerId,
    amount,
    method,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      ),
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentsTableTable createAlias(String alias) {
    return $PaymentsTableTable(attachedDatabase, alias);
  }
}

class PaymentDbModel extends DataClass implements Insertable<PaymentDbModel> {
  final int id;
  final int? invoiceId;
  final int? customerId;
  final double amount;
  final String method;
  final DateTime createdAt;
  const PaymentDbModel({
    required this.id,
    this.invoiceId,
    this.customerId,
    required this.amount,
    required this.method,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || invoiceId != null) {
      map['invoice_id'] = Variable<int>(invoiceId);
    }
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    map['amount'] = Variable<double>(amount);
    map['method'] = Variable<String>(method);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return PaymentsTableCompanion(
      id: Value(id),
      invoiceId: invoiceId == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceId),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      amount: Value(amount),
      method: Value(method),
      createdAt: Value(createdAt),
    );
  }

  factory PaymentDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentDbModel(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int?>(json['invoiceId']),
      customerId: serializer.fromJson<int?>(json['customerId']),
      amount: serializer.fromJson<double>(json['amount']),
      method: serializer.fromJson<String>(json['method']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int?>(invoiceId),
      'customerId': serializer.toJson<int?>(customerId),
      'amount': serializer.toJson<double>(amount),
      'method': serializer.toJson<String>(method),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PaymentDbModel copyWith({
    int? id,
    Value<int?> invoiceId = const Value.absent(),
    Value<int?> customerId = const Value.absent(),
    double? amount,
    String? method,
    DateTime? createdAt,
  }) => PaymentDbModel(
    id: id ?? this.id,
    invoiceId: invoiceId.present ? invoiceId.value : this.invoiceId,
    customerId: customerId.present ? customerId.value : this.customerId,
    amount: amount ?? this.amount,
    method: method ?? this.method,
    createdAt: createdAt ?? this.createdAt,
  );
  PaymentDbModel copyWithCompanion(PaymentsTableCompanion data) {
    return PaymentDbModel(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      amount: data.amount.present ? data.amount.value : this.amount,
      method: data.method.present ? data.method.value : this.method,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentDbModel(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, invoiceId, customerId, amount, method, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentDbModel &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.customerId == this.customerId &&
          other.amount == this.amount &&
          other.method == this.method &&
          other.createdAt == this.createdAt);
}

class PaymentsTableCompanion extends UpdateCompanion<PaymentDbModel> {
  final Value<int> id;
  final Value<int?> invoiceId;
  final Value<int?> customerId;
  final Value<double> amount;
  final Value<String> method;
  final Value<DateTime> createdAt;
  const PaymentsTableCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.amount = const Value.absent(),
    this.method = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentsTableCompanion.insert({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.customerId = const Value.absent(),
    required double amount,
    required String method,
    this.createdAt = const Value.absent(),
  }) : amount = Value(amount),
       method = Value(method);
  static Insertable<PaymentDbModel> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? customerId,
    Expression<double>? amount,
    Expression<String>? method,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (customerId != null) 'customer_id': customerId,
      if (amount != null) 'amount': amount,
      if (method != null) 'method': method,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentsTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? invoiceId,
    Value<int?>? customerId,
    Value<double>? amount,
    Value<String>? method,
    Value<DateTime>? createdAt,
  }) {
    return PaymentsTableCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MasterDrugsTableTable extends MasterDrugsTable
    with TableInfo<$MasterDrugsTableTable, MasterDrugsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterDrugsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    barcode,
    category,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master_drugs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MasterDrugsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasterDrugsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterDrugsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $MasterDrugsTableTable createAlias(String alias) {
    return $MasterDrugsTableTable(attachedDatabase, alias);
  }
}

class MasterDrugsTableData extends DataClass
    implements Insertable<MasterDrugsTableData> {
  final String id;
  final String name;
  final String? barcode;
  final String? category;
  final String? description;
  const MasterDrugsTableData({
    required this.id,
    required this.name,
    this.barcode,
    this.category,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  MasterDrugsTableCompanion toCompanion(bool nullToAbsent) {
    return MasterDrugsTableCompanion(
      id: Value(id),
      name: Value(name),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory MasterDrugsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterDrugsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      category: serializer.fromJson<String?>(json['category']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'barcode': serializer.toJson<String?>(barcode),
      'category': serializer.toJson<String?>(category),
      'description': serializer.toJson<String?>(description),
    };
  }

  MasterDrugsTableData copyWith({
    String? id,
    String? name,
    Value<String?> barcode = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => MasterDrugsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    barcode: barcode.present ? barcode.value : this.barcode,
    category: category.present ? category.value : this.category,
    description: description.present ? description.value : this.description,
  );
  MasterDrugsTableData copyWithCompanion(MasterDrugsTableCompanion data) {
    return MasterDrugsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterDrugsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('barcode: $barcode, ')
          ..write('category: $category, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, barcode, category, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterDrugsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.barcode == this.barcode &&
          other.category == this.category &&
          other.description == this.description);
}

class MasterDrugsTableCompanion extends UpdateCompanion<MasterDrugsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> barcode;
  final Value<String?> category;
  final Value<String?> description;
  final Value<int> rowid;
  const MasterDrugsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.barcode = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasterDrugsTableCompanion.insert({
    required String id,
    required String name,
    this.barcode = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<MasterDrugsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? barcode,
    Expression<String>? category,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (barcode != null) 'barcode': barcode,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasterDrugsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? barcode,
    Value<String?>? category,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return MasterDrugsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      category: category ?? this.category,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterDrugsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('barcode: $barcode, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MasterUnitsTableTable extends MasterUnitsTable
    with TableInfo<$MasterUnitsTableTable, MasterUnitsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterUnitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _masterDrugIdMeta = const VerificationMeta(
    'masterDrugId',
  );
  @override
  late final GeneratedColumn<String> masterDrugId = GeneratedColumn<String>(
    'master_drug_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES master_drugs_table (id)',
    ),
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conversionFactorMeta = const VerificationMeta(
    'conversionFactor',
  );
  @override
  late final GeneratedColumn<double> conversionFactor = GeneratedColumn<double>(
    'conversion_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    masterDrugId,
    unitName,
    conversionFactor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master_units_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MasterUnitsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('master_drug_id')) {
      context.handle(
        _masterDrugIdMeta,
        masterDrugId.isAcceptableOrUnknown(
          data['master_drug_id']!,
          _masterDrugIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_masterDrugIdMeta);
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
        _conversionFactorMeta,
        conversionFactor.isAcceptableOrUnknown(
          data['conversion_factor']!,
          _conversionFactorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversionFactorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasterUnitsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterUnitsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      masterDrugId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}master_drug_id'],
      )!,
      unitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_name'],
      )!,
      conversionFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}conversion_factor'],
      )!,
    );
  }

  @override
  $MasterUnitsTableTable createAlias(String alias) {
    return $MasterUnitsTableTable(attachedDatabase, alias);
  }
}

class MasterUnitsTableData extends DataClass
    implements Insertable<MasterUnitsTableData> {
  final String id;
  final String masterDrugId;
  final String unitName;
  final double conversionFactor;
  const MasterUnitsTableData({
    required this.id,
    required this.masterDrugId,
    required this.unitName,
    required this.conversionFactor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['master_drug_id'] = Variable<String>(masterDrugId);
    map['unit_name'] = Variable<String>(unitName);
    map['conversion_factor'] = Variable<double>(conversionFactor);
    return map;
  }

  MasterUnitsTableCompanion toCompanion(bool nullToAbsent) {
    return MasterUnitsTableCompanion(
      id: Value(id),
      masterDrugId: Value(masterDrugId),
      unitName: Value(unitName),
      conversionFactor: Value(conversionFactor),
    );
  }

  factory MasterUnitsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterUnitsTableData(
      id: serializer.fromJson<String>(json['id']),
      masterDrugId: serializer.fromJson<String>(json['masterDrugId']),
      unitName: serializer.fromJson<String>(json['unitName']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'masterDrugId': serializer.toJson<String>(masterDrugId),
      'unitName': serializer.toJson<String>(unitName),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
    };
  }

  MasterUnitsTableData copyWith({
    String? id,
    String? masterDrugId,
    String? unitName,
    double? conversionFactor,
  }) => MasterUnitsTableData(
    id: id ?? this.id,
    masterDrugId: masterDrugId ?? this.masterDrugId,
    unitName: unitName ?? this.unitName,
    conversionFactor: conversionFactor ?? this.conversionFactor,
  );
  MasterUnitsTableData copyWithCompanion(MasterUnitsTableCompanion data) {
    return MasterUnitsTableData(
      id: data.id.present ? data.id.value : this.id,
      masterDrugId: data.masterDrugId.present
          ? data.masterDrugId.value
          : this.masterDrugId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      conversionFactor: data.conversionFactor.present
          ? data.conversionFactor.value
          : this.conversionFactor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterUnitsTableData(')
          ..write('id: $id, ')
          ..write('masterDrugId: $masterDrugId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, masterDrugId, unitName, conversionFactor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterUnitsTableData &&
          other.id == this.id &&
          other.masterDrugId == this.masterDrugId &&
          other.unitName == this.unitName &&
          other.conversionFactor == this.conversionFactor);
}

class MasterUnitsTableCompanion extends UpdateCompanion<MasterUnitsTableData> {
  final Value<String> id;
  final Value<String> masterDrugId;
  final Value<String> unitName;
  final Value<double> conversionFactor;
  final Value<int> rowid;
  const MasterUnitsTableCompanion({
    this.id = const Value.absent(),
    this.masterDrugId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.conversionFactor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MasterUnitsTableCompanion.insert({
    required String id,
    required String masterDrugId,
    required String unitName,
    required double conversionFactor,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       masterDrugId = Value(masterDrugId),
       unitName = Value(unitName),
       conversionFactor = Value(conversionFactor);
  static Insertable<MasterUnitsTableData> custom({
    Expression<String>? id,
    Expression<String>? masterDrugId,
    Expression<String>? unitName,
    Expression<double>? conversionFactor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (masterDrugId != null) 'master_drug_id': masterDrugId,
      if (unitName != null) 'unit_name': unitName,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MasterUnitsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? masterDrugId,
    Value<String>? unitName,
    Value<double>? conversionFactor,
    Value<int>? rowid,
  }) {
    return MasterUnitsTableCompanion(
      id: id ?? this.id,
      masterDrugId: masterDrugId ?? this.masterDrugId,
      unitName: unitName ?? this.unitName,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (masterDrugId.present) {
      map['master_drug_id'] = Variable<String>(masterDrugId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterUnitsTableCompanion(')
          ..write('id: $id, ')
          ..write('masterDrugId: $masterDrugId, ')
          ..write('unitName: $unitName, ')
          ..write('conversionFactor: $conversionFactor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PharmaciesTableTable pharmaciesTable = $PharmaciesTableTable(
    this,
  );
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $CustomersTableTable customersTable = $CustomersTableTable(this);
  late final $CategoriesTableTable categoriesTable = $CategoriesTableTable(
    this,
  );
  late final $ManufacturersTableTable manufacturersTable =
      $ManufacturersTableTable(this);
  late final $SuppliersTableTable suppliersTable = $SuppliersTableTable(this);
  late final $SupplierPaymentsTableTable supplierPaymentsTable =
      $SupplierPaymentsTableTable(this);
  late final $PurchaseInvoicesTableTable purchaseInvoicesTable =
      $PurchaseInvoicesTableTable(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $ProductUnitsTableTable productUnitsTable =
      $ProductUnitsTableTable(this);
  late final $ProductBatchesTableTable productBatchesTable =
      $ProductBatchesTableTable(this);
  late final $CashSessionsTableTable cashSessionsTable =
      $CashSessionsTableTable(this);
  late final $InvoicesTableTable invoicesTable = $InvoicesTableTable(this);
  late final $InvoiceItemsTableTable invoiceItemsTable =
      $InvoiceItemsTableTable(this);
  late final $ReturnsTableTable returnsTable = $ReturnsTableTable(this);
  late final $ReturnItemsTableTable returnItemsTable = $ReturnItemsTableTable(
    this,
  );
  late final $AuditLogsTableTable auditLogsTable = $AuditLogsTableTable(this);
  late final $PaymentsTableTable paymentsTable = $PaymentsTableTable(this);
  late final $MasterDrugsTableTable masterDrugsTable = $MasterDrugsTableTable(
    this,
  );
  late final $MasterUnitsTableTable masterUnitsTable = $MasterUnitsTableTable(
    this,
  );
  late final SyncDao syncDao = SyncDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pharmaciesTable,
    usersTable,
    customersTable,
    categoriesTable,
    manufacturersTable,
    suppliersTable,
    supplierPaymentsTable,
    purchaseInvoicesTable,
    productsTable,
    productUnitsTable,
    productBatchesTable,
    cashSessionsTable,
    invoicesTable,
    invoiceItemsTable,
    returnsTable,
    returnItemsTable,
    auditLogsTable,
    paymentsTable,
    masterDrugsTable,
    masterUnitsTable,
  ];
}

typedef $$PharmaciesTableTableCreateCompanionBuilder =
    PharmaciesTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> licenseNumber,
      Value<DateTime> createdAt,
    });
typedef $$PharmaciesTableTableUpdateCompanionBuilder =
    PharmaciesTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> licenseNumber,
      Value<DateTime> createdAt,
    });

class $$PharmaciesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PharmaciesTableTable> {
  $$PharmaciesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licenseNumber => $composableBuilder(
    column: $table.licenseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PharmaciesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PharmaciesTableTable> {
  $$PharmaciesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licenseNumber => $composableBuilder(
    column: $table.licenseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PharmaciesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PharmaciesTableTable> {
  $$PharmaciesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get licenseNumber => $composableBuilder(
    column: $table.licenseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PharmaciesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PharmaciesTableTable,
          PharmacyDbModel,
          $$PharmaciesTableTableFilterComposer,
          $$PharmaciesTableTableOrderingComposer,
          $$PharmaciesTableTableAnnotationComposer,
          $$PharmaciesTableTableCreateCompanionBuilder,
          $$PharmaciesTableTableUpdateCompanionBuilder,
          (
            PharmacyDbModel,
            BaseReferences<
              _$AppDatabase,
              $PharmaciesTableTable,
              PharmacyDbModel
            >,
          ),
          PharmacyDbModel,
          PrefetchHooks Function()
        > {
  $$PharmaciesTableTableTableManager(
    _$AppDatabase db,
    $PharmaciesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PharmaciesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PharmaciesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PharmaciesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> licenseNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PharmaciesTableCompanion(
                id: id,
                name: name,
                licenseNumber: licenseNumber,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> licenseNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PharmaciesTableCompanion.insert(
                id: id,
                name: name,
                licenseNumber: licenseNumber,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PharmaciesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PharmaciesTableTable,
      PharmacyDbModel,
      $$PharmaciesTableTableFilterComposer,
      $$PharmaciesTableTableOrderingComposer,
      $$PharmaciesTableTableAnnotationComposer,
      $$PharmaciesTableTableCreateCompanionBuilder,
      $$PharmaciesTableTableUpdateCompanionBuilder,
      (
        PharmacyDbModel,
        BaseReferences<_$AppDatabase, $PharmaciesTableTable, PharmacyDbModel>,
      ),
      PharmacyDbModel,
      PrefetchHooks Function()
    >;
typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required String name,
      Value<String?> email,
      Value<String?> phoneNumber,
      required String passwordHash,
      required String role,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<String> name,
      Value<String?> email,
      Value<String?> phoneNumber,
      Value<String> passwordHash,
      Value<String> role,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UserDbModel,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (
            UserDbModel,
            BaseReferences<_$AppDatabase, $UsersTableTable, UserDbModel>,
          ),
          UserDbModel,
          PrefetchHooks Function()
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                email: email,
                phoneNumber: phoneNumber,
                passwordHash: passwordHash,
                role: role,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                required String passwordHash,
                required String role,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                email: email,
                phoneNumber: phoneNumber,
                passwordHash: passwordHash,
                role: role,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UserDbModel,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (
        UserDbModel,
        BaseReferences<_$AppDatabase, $UsersTableTable, UserDbModel>,
      ),
      UserDbModel,
      PrefetchHooks Function()
    >;
typedef $$CustomersTableTableCreateCompanionBuilder =
    CustomersTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required String name,
      Value<String?> phone,
      Value<double> totalDebt,
      Value<DateTime> createdAt,
    });
typedef $$CustomersTableTableUpdateCompanionBuilder =
    CustomersTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<String> name,
      Value<String?> phone,
      Value<double> totalDebt,
      Value<DateTime> createdAt,
    });

class $$CustomersTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTableTable> {
  $$CustomersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalDebt => $composableBuilder(
    column: $table.totalDebt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTableTable> {
  $$CustomersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalDebt => $composableBuilder(
    column: $table.totalDebt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTableTable> {
  $$CustomersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<double> get totalDebt =>
      $composableBuilder(column: $table.totalDebt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTableTable,
          CustomerDbModel,
          $$CustomersTableTableFilterComposer,
          $$CustomersTableTableOrderingComposer,
          $$CustomersTableTableAnnotationComposer,
          $$CustomersTableTableCreateCompanionBuilder,
          $$CustomersTableTableUpdateCompanionBuilder,
          (
            CustomerDbModel,
            BaseReferences<
              _$AppDatabase,
              $CustomersTableTable,
              CustomerDbModel
            >,
          ),
          CustomerDbModel,
          PrefetchHooks Function()
        > {
  $$CustomersTableTableTableManager(
    _$AppDatabase db,
    $CustomersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<double> totalDebt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomersTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                phone: phone,
                totalDebt: totalDebt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<double> totalDebt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomersTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                phone: phone,
                totalDebt: totalDebt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTableTable,
      CustomerDbModel,
      $$CustomersTableTableFilterComposer,
      $$CustomersTableTableOrderingComposer,
      $$CustomersTableTableAnnotationComposer,
      $$CustomersTableTableCreateCompanionBuilder,
      $$CustomersTableTableUpdateCompanionBuilder,
      (
        CustomerDbModel,
        BaseReferences<_$AppDatabase, $CustomersTableTable, CustomerDbModel>,
      ),
      CustomerDbModel,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableTableCreateCompanionBuilder =
    CategoriesTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required String name,
    });
typedef $$CategoriesTableTableUpdateCompanionBuilder =
    CategoriesTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<String> name,
    });

class $$CategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTableTable,
          CategoryDbModel,
          $$CategoriesTableTableFilterComposer,
          $$CategoriesTableTableOrderingComposer,
          $$CategoriesTableTableAnnotationComposer,
          $$CategoriesTableTableCreateCompanionBuilder,
          $$CategoriesTableTableUpdateCompanionBuilder,
          (
            CategoryDbModel,
            BaseReferences<
              _$AppDatabase,
              $CategoriesTableTable,
              CategoryDbModel
            >,
          ),
          CategoryDbModel,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableTableManager(
    _$AppDatabase db,
    $CategoriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CategoriesTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required String name,
              }) => CategoriesTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTableTable,
      CategoryDbModel,
      $$CategoriesTableTableFilterComposer,
      $$CategoriesTableTableOrderingComposer,
      $$CategoriesTableTableAnnotationComposer,
      $$CategoriesTableTableCreateCompanionBuilder,
      $$CategoriesTableTableUpdateCompanionBuilder,
      (
        CategoryDbModel,
        BaseReferences<_$AppDatabase, $CategoriesTableTable, CategoryDbModel>,
      ),
      CategoryDbModel,
      PrefetchHooks Function()
    >;
typedef $$ManufacturersTableTableCreateCompanionBuilder =
    ManufacturersTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required String name,
    });
typedef $$ManufacturersTableTableUpdateCompanionBuilder =
    ManufacturersTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<String> name,
    });

class $$ManufacturersTableTableFilterComposer
    extends Composer<_$AppDatabase, $ManufacturersTableTable> {
  $$ManufacturersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ManufacturersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ManufacturersTableTable> {
  $$ManufacturersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ManufacturersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ManufacturersTableTable> {
  $$ManufacturersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$ManufacturersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ManufacturersTableTable,
          ManufacturerDbModel,
          $$ManufacturersTableTableFilterComposer,
          $$ManufacturersTableTableOrderingComposer,
          $$ManufacturersTableTableAnnotationComposer,
          $$ManufacturersTableTableCreateCompanionBuilder,
          $$ManufacturersTableTableUpdateCompanionBuilder,
          (
            ManufacturerDbModel,
            BaseReferences<
              _$AppDatabase,
              $ManufacturersTableTable,
              ManufacturerDbModel
            >,
          ),
          ManufacturerDbModel,
          PrefetchHooks Function()
        > {
  $$ManufacturersTableTableTableManager(
    _$AppDatabase db,
    $ManufacturersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ManufacturersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ManufacturersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ManufacturersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => ManufacturersTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required String name,
              }) => ManufacturersTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ManufacturersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ManufacturersTableTable,
      ManufacturerDbModel,
      $$ManufacturersTableTableFilterComposer,
      $$ManufacturersTableTableOrderingComposer,
      $$ManufacturersTableTableAnnotationComposer,
      $$ManufacturersTableTableCreateCompanionBuilder,
      $$ManufacturersTableTableUpdateCompanionBuilder,
      (
        ManufacturerDbModel,
        BaseReferences<
          _$AppDatabase,
          $ManufacturersTableTable,
          ManufacturerDbModel
        >,
      ),
      ManufacturerDbModel,
      PrefetchHooks Function()
    >;
typedef $$SuppliersTableTableCreateCompanionBuilder =
    SuppliersTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required String name,
      Value<String?> companyName,
      Value<String?> phone,
      Value<double> openingBalance,
      Value<DateTime> createdAt,
    });
typedef $$SuppliersTableTableUpdateCompanionBuilder =
    SuppliersTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<String> name,
      Value<String?> companyName,
      Value<String?> phone,
      Value<double> openingBalance,
      Value<DateTime> createdAt,
    });

final class $$SuppliersTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SuppliersTableTable, SupplierDbModel> {
  $$SuppliersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $SupplierPaymentsTableTable,
    List<SupplierPaymentDbModel>
  >
  _supplierPaymentsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.supplierPaymentsTable,
        aliasName: $_aliasNameGenerator(
          db.suppliersTable.id,
          db.supplierPaymentsTable.supplierId,
        ),
      );

  $$SupplierPaymentsTableTableProcessedTableManager
  get supplierPaymentsTableRefs {
    final manager = $$SupplierPaymentsTableTableTableManager(
      $_db,
      $_db.supplierPaymentsTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _supplierPaymentsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PurchaseInvoicesTableTable,
    List<PurchaseInvoiceDbModel>
  >
  _purchaseInvoicesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseInvoicesTable,
        aliasName: $_aliasNameGenerator(
          db.suppliersTable.id,
          db.purchaseInvoicesTable.supplierId,
        ),
      );

  $$PurchaseInvoicesTableTableProcessedTableManager
  get purchaseInvoicesTableRefs {
    final manager = $$PurchaseInvoicesTableTableTableManager(
      $_db,
      $_db.purchaseInvoicesTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseInvoicesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SuppliersTableTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTableTable> {
  $$SuppliersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplierPaymentsTableRefs(
    Expression<bool> Function($$SupplierPaymentsTableTableFilterComposer f) f,
  ) {
    final $$SupplierPaymentsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierPaymentsTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierPaymentsTableTableFilterComposer(
                $db: $db,
                $table: $db.supplierPaymentsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> purchaseInvoicesTableRefs(
    Expression<bool> Function($$PurchaseInvoicesTableTableFilterComposer f) f,
  ) {
    final $$PurchaseInvoicesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseInvoicesTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseInvoicesTableTableFilterComposer(
                $db: $db,
                $table: $db.purchaseInvoicesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SuppliersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTableTable> {
  $$SuppliersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTableTable> {
  $$SuppliersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> supplierPaymentsTableRefs<T extends Object>(
    Expression<T> Function($$SupplierPaymentsTableTableAnnotationComposer a) f,
  ) {
    final $$SupplierPaymentsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierPaymentsTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierPaymentsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.supplierPaymentsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> purchaseInvoicesTableRefs<T extends Object>(
    Expression<T> Function($$PurchaseInvoicesTableTableAnnotationComposer a) f,
  ) {
    final $$PurchaseInvoicesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseInvoicesTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseInvoicesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseInvoicesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SuppliersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SuppliersTableTable,
          SupplierDbModel,
          $$SuppliersTableTableFilterComposer,
          $$SuppliersTableTableOrderingComposer,
          $$SuppliersTableTableAnnotationComposer,
          $$SuppliersTableTableCreateCompanionBuilder,
          $$SuppliersTableTableUpdateCompanionBuilder,
          (SupplierDbModel, $$SuppliersTableTableReferences),
          SupplierDbModel,
          PrefetchHooks Function({
            bool supplierPaymentsTableRefs,
            bool purchaseInvoicesTableRefs,
          })
        > {
  $$SuppliersTableTableTableManager(
    _$AppDatabase db,
    $SuppliersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SuppliersTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                companyName: companyName,
                phone: phone,
                openingBalance: openingBalance,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required String name,
                Value<String?> companyName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SuppliersTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                name: name,
                companyName: companyName,
                phone: phone,
                openingBalance: openingBalance,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SuppliersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                supplierPaymentsTableRefs = false,
                purchaseInvoicesTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (supplierPaymentsTableRefs) db.supplierPaymentsTable,
                    if (purchaseInvoicesTableRefs) db.purchaseInvoicesTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (supplierPaymentsTableRefs)
                        await $_getPrefetchedData<
                          SupplierDbModel,
                          $SuppliersTableTable,
                          SupplierPaymentDbModel
                        >(
                          currentTable: table,
                          referencedTable: $$SuppliersTableTableReferences
                              ._supplierPaymentsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SuppliersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).supplierPaymentsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.supplierId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchaseInvoicesTableRefs)
                        await $_getPrefetchedData<
                          SupplierDbModel,
                          $SuppliersTableTable,
                          PurchaseInvoiceDbModel
                        >(
                          currentTable: table,
                          referencedTable: $$SuppliersTableTableReferences
                              ._purchaseInvoicesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SuppliersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseInvoicesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.supplierId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SuppliersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SuppliersTableTable,
      SupplierDbModel,
      $$SuppliersTableTableFilterComposer,
      $$SuppliersTableTableOrderingComposer,
      $$SuppliersTableTableAnnotationComposer,
      $$SuppliersTableTableCreateCompanionBuilder,
      $$SuppliersTableTableUpdateCompanionBuilder,
      (SupplierDbModel, $$SuppliersTableTableReferences),
      SupplierDbModel,
      PrefetchHooks Function({
        bool supplierPaymentsTableRefs,
        bool purchaseInvoicesTableRefs,
      })
    >;
typedef $$SupplierPaymentsTableTableCreateCompanionBuilder =
    SupplierPaymentsTableCompanion Function({
      Value<int> id,
      required int supplierId,
      required double amount,
      required DateTime paymentDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$SupplierPaymentsTableTableUpdateCompanionBuilder =
    SupplierPaymentsTableCompanion Function({
      Value<int> id,
      Value<int> supplierId,
      Value<double> amount,
      Value<DateTime> paymentDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

final class $$SupplierPaymentsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SupplierPaymentsTableTable,
          SupplierPaymentDbModel
        > {
  $$SupplierPaymentsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SuppliersTableTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliersTable.createAlias(
        $_aliasNameGenerator(
          db.supplierPaymentsTable.supplierId,
          db.suppliersTable.id,
        ),
      );

  $$SuppliersTableTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<int>('supplier_id')!;

    final manager = $$SuppliersTableTableTableManager(
      $_db,
      $_db.suppliersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplierPaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTableTable> {
  $$SupplierPaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SuppliersTableTableFilterComposer get supplierId {
    final $$SuppliersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableFilterComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierPaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTableTable> {
  $$SupplierPaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SuppliersTableTableOrderingComposer get supplierId {
    final $$SuppliersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableOrderingComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierPaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTableTable> {
  $$SupplierPaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SuppliersTableTableAnnotationComposer get supplierId {
    final $$SuppliersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierPaymentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierPaymentsTableTable,
          SupplierPaymentDbModel,
          $$SupplierPaymentsTableTableFilterComposer,
          $$SupplierPaymentsTableTableOrderingComposer,
          $$SupplierPaymentsTableTableAnnotationComposer,
          $$SupplierPaymentsTableTableCreateCompanionBuilder,
          $$SupplierPaymentsTableTableUpdateCompanionBuilder,
          (SupplierPaymentDbModel, $$SupplierPaymentsTableTableReferences),
          SupplierPaymentDbModel,
          PrefetchHooks Function({bool supplierId})
        > {
  $$SupplierPaymentsTableTableTableManager(
    _$AppDatabase db,
    $SupplierPaymentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierPaymentsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SupplierPaymentsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SupplierPaymentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supplierId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SupplierPaymentsTableCompanion(
                id: id,
                supplierId: supplierId,
                amount: amount,
                paymentDate: paymentDate,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supplierId,
                required double amount,
                required DateTime paymentDate,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SupplierPaymentsTableCompanion.insert(
                id: id,
                supplierId: supplierId,
                amount: amount,
                paymentDate: paymentDate,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierPaymentsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable:
                                    $$SupplierPaymentsTableTableReferences
                                        ._supplierIdTable(db),
                                referencedColumn:
                                    $$SupplierPaymentsTableTableReferences
                                        ._supplierIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SupplierPaymentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierPaymentsTableTable,
      SupplierPaymentDbModel,
      $$SupplierPaymentsTableTableFilterComposer,
      $$SupplierPaymentsTableTableOrderingComposer,
      $$SupplierPaymentsTableTableAnnotationComposer,
      $$SupplierPaymentsTableTableCreateCompanionBuilder,
      $$SupplierPaymentsTableTableUpdateCompanionBuilder,
      (SupplierPaymentDbModel, $$SupplierPaymentsTableTableReferences),
      SupplierPaymentDbModel,
      PrefetchHooks Function({bool supplierId})
    >;
typedef $$PurchaseInvoicesTableTableCreateCompanionBuilder =
    PurchaseInvoicesTableCompanion Function({
      Value<int> id,
      required int supplierId,
      Value<String?> invoiceNumber,
      required DateTime invoiceDate,
      required double totalAmount,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$PurchaseInvoicesTableTableUpdateCompanionBuilder =
    PurchaseInvoicesTableCompanion Function({
      Value<int> id,
      Value<int> supplierId,
      Value<String?> invoiceNumber,
      Value<DateTime> invoiceDate,
      Value<double> totalAmount,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

final class $$PurchaseInvoicesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseInvoicesTableTable,
          PurchaseInvoiceDbModel
        > {
  $$PurchaseInvoicesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SuppliersTableTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliersTable.createAlias(
        $_aliasNameGenerator(
          db.purchaseInvoicesTable.supplierId,
          db.suppliersTable.id,
        ),
      );

  $$SuppliersTableTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<int>('supplier_id')!;

    final manager = $$SuppliersTableTableTableManager(
      $_db,
      $_db.suppliersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PurchaseInvoicesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTableTable> {
  $$PurchaseInvoicesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SuppliersTableTableFilterComposer get supplierId {
    final $$SuppliersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableFilterComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoicesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTableTable> {
  $$PurchaseInvoicesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SuppliersTableTableOrderingComposer get supplierId {
    final $$SuppliersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableOrderingComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoicesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTableTable> {
  $$PurchaseInvoicesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get invoiceDate => $composableBuilder(
    column: $table.invoiceDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SuppliersTableTableAnnotationComposer get supplierId {
    final $$SuppliersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.suppliersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoicesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseInvoicesTableTable,
          PurchaseInvoiceDbModel,
          $$PurchaseInvoicesTableTableFilterComposer,
          $$PurchaseInvoicesTableTableOrderingComposer,
          $$PurchaseInvoicesTableTableAnnotationComposer,
          $$PurchaseInvoicesTableTableCreateCompanionBuilder,
          $$PurchaseInvoicesTableTableUpdateCompanionBuilder,
          (PurchaseInvoiceDbModel, $$PurchaseInvoicesTableTableReferences),
          PurchaseInvoiceDbModel,
          PrefetchHooks Function({bool supplierId})
        > {
  $$PurchaseInvoicesTableTableTableManager(
    _$AppDatabase db,
    $PurchaseInvoicesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoicesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PurchaseInvoicesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PurchaseInvoicesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supplierId = const Value.absent(),
                Value<String?> invoiceNumber = const Value.absent(),
                Value<DateTime> invoiceDate = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PurchaseInvoicesTableCompanion(
                id: id,
                supplierId: supplierId,
                invoiceNumber: invoiceNumber,
                invoiceDate: invoiceDate,
                totalAmount: totalAmount,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supplierId,
                Value<String?> invoiceNumber = const Value.absent(),
                required DateTime invoiceDate,
                required double totalAmount,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PurchaseInvoicesTableCompanion.insert(
                id: id,
                supplierId: supplierId,
                invoiceNumber: invoiceNumber,
                invoiceDate: invoiceDate,
                totalAmount: totalAmount,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchaseInvoicesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable:
                                    $$PurchaseInvoicesTableTableReferences
                                        ._supplierIdTable(db),
                                referencedColumn:
                                    $$PurchaseInvoicesTableTableReferences
                                        ._supplierIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PurchaseInvoicesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseInvoicesTableTable,
      PurchaseInvoiceDbModel,
      $$PurchaseInvoicesTableTableFilterComposer,
      $$PurchaseInvoicesTableTableOrderingComposer,
      $$PurchaseInvoicesTableTableAnnotationComposer,
      $$PurchaseInvoicesTableTableCreateCompanionBuilder,
      $$PurchaseInvoicesTableTableUpdateCompanionBuilder,
      (PurchaseInvoiceDbModel, $$PurchaseInvoicesTableTableReferences),
      PurchaseInvoiceDbModel,
      PrefetchHooks Function({bool supplierId})
    >;
typedef $$ProductsTableTableCreateCompanionBuilder =
    ProductsTableCompanion Function({
      required String id,
      required String pharmacyId,
      Value<String?> masterDrugId,
      required String localName,
      Value<String?> barcode,
      required double minStockThreshold,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ProductsTableTableUpdateCompanionBuilder =
    ProductsTableCompanion Function({
      Value<String> id,
      Value<String> pharmacyId,
      Value<String?> masterDrugId,
      Value<String> localName,
      Value<String?> barcode,
      Value<double> minStockThreshold,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$ProductsTableTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTableTable, ProductDbModel> {
  $$ProductsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProductUnitsTableTable, List<ProductUnitDbModel>>
  _productUnitsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productUnitsTable,
        aliasName: $_aliasNameGenerator(
          db.productsTable.id,
          db.productUnitsTable.productId,
        ),
      );

  $$ProductUnitsTableTableProcessedTableManager get productUnitsTableRefs {
    final manager = $$ProductUnitsTableTableTableManager(
      $_db,
      $_db.productUnitsTable,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productUnitsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get masterDrugId => $composableBuilder(
    column: $table.masterDrugId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minStockThreshold => $composableBuilder(
    column: $table.minStockThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productUnitsTableRefs(
    Expression<bool> Function($$ProductUnitsTableTableFilterComposer f) f,
  ) {
    final $$ProductUnitsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productUnitsTable,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductUnitsTableTableFilterComposer(
            $db: $db,
            $table: $db.productUnitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get masterDrugId => $composableBuilder(
    column: $table.masterDrugId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minStockThreshold => $composableBuilder(
    column: $table.minStockThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get masterDrugId => $composableBuilder(
    column: $table.masterDrugId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localName =>
      $composableBuilder(column: $table.localName, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<double> get minStockThreshold => $composableBuilder(
    column: $table.minStockThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> productUnitsTableRefs<T extends Object>(
    Expression<T> Function($$ProductUnitsTableTableAnnotationComposer a) f,
  ) {
    final $$ProductUnitsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productUnitsTable,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductUnitsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.productUnitsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTableTable,
          ProductDbModel,
          $$ProductsTableTableFilterComposer,
          $$ProductsTableTableOrderingComposer,
          $$ProductsTableTableAnnotationComposer,
          $$ProductsTableTableCreateCompanionBuilder,
          $$ProductsTableTableUpdateCompanionBuilder,
          (ProductDbModel, $$ProductsTableTableReferences),
          ProductDbModel,
          PrefetchHooks Function({bool productUnitsTableRefs})
        > {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pharmacyId = const Value.absent(),
                Value<String?> masterDrugId = const Value.absent(),
                Value<String> localName = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<double> minStockThreshold = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                masterDrugId: masterDrugId,
                localName: localName,
                barcode: barcode,
                minStockThreshold: minStockThreshold,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pharmacyId,
                Value<String?> masterDrugId = const Value.absent(),
                required String localName,
                Value<String?> barcode = const Value.absent(),
                required double minStockThreshold,
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                masterDrugId: masterDrugId,
                localName: localName,
                barcode: barcode,
                minStockThreshold: minStockThreshold,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productUnitsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productUnitsTableRefs) db.productUnitsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productUnitsTableRefs)
                    await $_getPrefetchedData<
                      ProductDbModel,
                      $ProductsTableTable,
                      ProductUnitDbModel
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableTableReferences
                          ._productUnitsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).productUnitsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTableTable,
      ProductDbModel,
      $$ProductsTableTableFilterComposer,
      $$ProductsTableTableOrderingComposer,
      $$ProductsTableTableAnnotationComposer,
      $$ProductsTableTableCreateCompanionBuilder,
      $$ProductsTableTableUpdateCompanionBuilder,
      (ProductDbModel, $$ProductsTableTableReferences),
      ProductDbModel,
      PrefetchHooks Function({bool productUnitsTableRefs})
    >;
typedef $$ProductUnitsTableTableCreateCompanionBuilder =
    ProductUnitsTableCompanion Function({
      Value<String> id,
      required String productId,
      required String pharmacyId,
      required String unitName,
      Value<double> conversionFactor,
      Value<double> costPrice,
      required double sellingPrice,
      Value<String?> barcode,
      Value<bool> isBaseUnit,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$ProductUnitsTableTableUpdateCompanionBuilder =
    ProductUnitsTableCompanion Function({
      Value<String> id,
      Value<String> productId,
      Value<String> pharmacyId,
      Value<String> unitName,
      Value<double> conversionFactor,
      Value<double> costPrice,
      Value<double> sellingPrice,
      Value<String?> barcode,
      Value<bool> isBaseUnit,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$ProductUnitsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductUnitsTableTable,
          ProductUnitDbModel
        > {
  $$ProductUnitsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.productsTable.createAlias(
        $_aliasNameGenerator(
          db.productUnitsTable.productId,
          db.productsTable.id,
        ),
      );

  $$ProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableTableManager(
      $_db,
      $_db.productsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceItemsTableTable, List<InvoiceItemDbModel>>
  _invoiceItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.invoiceItemsTable,
        aliasName: $_aliasNameGenerator(
          db.productUnitsTable.id,
          db.invoiceItemsTable.unitId,
        ),
      );

  $$InvoiceItemsTableTableProcessedTableManager get invoiceItemsTableRefs {
    final manager = $$InvoiceItemsTableTableTableManager(
      $_db,
      $_db.invoiceItemsTable,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _invoiceItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductUnitsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductUnitsTableTable> {
  $$ProductUnitsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sellingPrice => $composableBuilder(
    column: $table.sellingPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBaseUnit => $composableBuilder(
    column: $table.isBaseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableTableFilterComposer get productId {
    final $$ProductsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableFilterComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceItemsTableRefs(
    Expression<bool> Function($$InvoiceItemsTableTableFilterComposer f) f,
  ) {
    final $$InvoiceItemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceItemsTable,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceItemsTableTableFilterComposer(
            $db: $db,
            $table: $db.invoiceItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductUnitsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductUnitsTableTable> {
  $$ProductUnitsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sellingPrice => $composableBuilder(
    column: $table.sellingPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBaseUnit => $composableBuilder(
    column: $table.isBaseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableTableOrderingComposer get productId {
    final $$ProductsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableOrderingComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductUnitsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductUnitsTableTable> {
  $$ProductUnitsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get sellingPrice => $composableBuilder(
    column: $table.sellingPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<bool> get isBaseUnit => $composableBuilder(
    column: $table.isBaseUnit,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProductsTableTableAnnotationComposer get productId {
    final $$ProductsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceItemsTableRefs<T extends Object>(
    Expression<T> Function($$InvoiceItemsTableTableAnnotationComposer a) f,
  ) {
    final $$InvoiceItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.invoiceItemsTable,
          getReferencedColumn: (t) => t.unitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InvoiceItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.invoiceItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductUnitsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductUnitsTableTable,
          ProductUnitDbModel,
          $$ProductUnitsTableTableFilterComposer,
          $$ProductUnitsTableTableOrderingComposer,
          $$ProductUnitsTableTableAnnotationComposer,
          $$ProductUnitsTableTableCreateCompanionBuilder,
          $$ProductUnitsTableTableUpdateCompanionBuilder,
          (ProductUnitDbModel, $$ProductUnitsTableTableReferences),
          ProductUnitDbModel,
          PrefetchHooks Function({bool productId, bool invoiceItemsTableRefs})
        > {
  $$ProductUnitsTableTableTableManager(
    _$AppDatabase db,
    $ProductUnitsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductUnitsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductUnitsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductUnitsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> pharmacyId = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<double> conversionFactor = const Value.absent(),
                Value<double> costPrice = const Value.absent(),
                Value<double> sellingPrice = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<bool> isBaseUnit = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductUnitsTableCompanion(
                id: id,
                productId: productId,
                pharmacyId: pharmacyId,
                unitName: unitName,
                conversionFactor: conversionFactor,
                costPrice: costPrice,
                sellingPrice: sellingPrice,
                barcode: barcode,
                isBaseUnit: isBaseUnit,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String productId,
                required String pharmacyId,
                required String unitName,
                Value<double> conversionFactor = const Value.absent(),
                Value<double> costPrice = const Value.absent(),
                required double sellingPrice,
                Value<String?> barcode = const Value.absent(),
                Value<bool> isBaseUnit = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductUnitsTableCompanion.insert(
                id: id,
                productId: productId,
                pharmacyId: pharmacyId,
                unitName: unitName,
                conversionFactor: conversionFactor,
                costPrice: costPrice,
                sellingPrice: sellingPrice,
                barcode: barcode,
                isBaseUnit: isBaseUnit,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductUnitsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, invoiceItemsTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceItemsTableRefs) db.invoiceItemsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$ProductUnitsTableTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$ProductUnitsTableTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceItemsTableRefs)
                        await $_getPrefetchedData<
                          ProductUnitDbModel,
                          $ProductUnitsTableTable,
                          InvoiceItemDbModel
                        >(
                          currentTable: table,
                          referencedTable: $$ProductUnitsTableTableReferences
                              ._invoiceItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductUnitsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductUnitsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductUnitsTableTable,
      ProductUnitDbModel,
      $$ProductUnitsTableTableFilterComposer,
      $$ProductUnitsTableTableOrderingComposer,
      $$ProductUnitsTableTableAnnotationComposer,
      $$ProductUnitsTableTableCreateCompanionBuilder,
      $$ProductUnitsTableTableUpdateCompanionBuilder,
      (ProductUnitDbModel, $$ProductUnitsTableTableReferences),
      ProductUnitDbModel,
      PrefetchHooks Function({bool productId, bool invoiceItemsTableRefs})
    >;
typedef $$ProductBatchesTableTableCreateCompanionBuilder =
    ProductBatchesTableCompanion Function({
      required String id,
      required String productId,
      required String pharmacyId,
      required String batchNumber,
      required DateTime expiryDate,
      required double quantityBaseUnit,
      Value<double> purchasePrice,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ProductBatchesTableTableUpdateCompanionBuilder =
    ProductBatchesTableCompanion Function({
      Value<String> id,
      Value<String> productId,
      Value<String> pharmacyId,
      Value<String> batchNumber,
      Value<DateTime> expiryDate,
      Value<double> quantityBaseUnit,
      Value<double> purchasePrice,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$ProductBatchesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductBatchesTableTable> {
  $$ProductBatchesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityBaseUnit => $composableBuilder(
    column: $table.quantityBaseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductBatchesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductBatchesTableTable> {
  $$ProductBatchesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityBaseUnit => $composableBuilder(
    column: $table.quantityBaseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductBatchesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductBatchesTableTable> {
  $$ProductBatchesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityBaseUnit => $composableBuilder(
    column: $table.quantityBaseUnit,
    builder: (column) => column,
  );

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ProductBatchesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductBatchesTableTable,
          ProductBatchDbModel,
          $$ProductBatchesTableTableFilterComposer,
          $$ProductBatchesTableTableOrderingComposer,
          $$ProductBatchesTableTableAnnotationComposer,
          $$ProductBatchesTableTableCreateCompanionBuilder,
          $$ProductBatchesTableTableUpdateCompanionBuilder,
          (
            ProductBatchDbModel,
            BaseReferences<
              _$AppDatabase,
              $ProductBatchesTableTable,
              ProductBatchDbModel
            >,
          ),
          ProductBatchDbModel,
          PrefetchHooks Function()
        > {
  $$ProductBatchesTableTableTableManager(
    _$AppDatabase db,
    $ProductBatchesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductBatchesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductBatchesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductBatchesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> pharmacyId = const Value.absent(),
                Value<String> batchNumber = const Value.absent(),
                Value<DateTime> expiryDate = const Value.absent(),
                Value<double> quantityBaseUnit = const Value.absent(),
                Value<double> purchasePrice = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductBatchesTableCompanion(
                id: id,
                productId: productId,
                pharmacyId: pharmacyId,
                batchNumber: batchNumber,
                expiryDate: expiryDate,
                quantityBaseUnit: quantityBaseUnit,
                purchasePrice: purchasePrice,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String productId,
                required String pharmacyId,
                required String batchNumber,
                required DateTime expiryDate,
                required double quantityBaseUnit,
                Value<double> purchasePrice = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductBatchesTableCompanion.insert(
                id: id,
                productId: productId,
                pharmacyId: pharmacyId,
                batchNumber: batchNumber,
                expiryDate: expiryDate,
                quantityBaseUnit: quantityBaseUnit,
                purchasePrice: purchasePrice,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductBatchesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductBatchesTableTable,
      ProductBatchDbModel,
      $$ProductBatchesTableTableFilterComposer,
      $$ProductBatchesTableTableOrderingComposer,
      $$ProductBatchesTableTableAnnotationComposer,
      $$ProductBatchesTableTableCreateCompanionBuilder,
      $$ProductBatchesTableTableUpdateCompanionBuilder,
      (
        ProductBatchDbModel,
        BaseReferences<
          _$AppDatabase,
          $ProductBatchesTableTable,
          ProductBatchDbModel
        >,
      ),
      ProductBatchDbModel,
      PrefetchHooks Function()
    >;
typedef $$CashSessionsTableTableCreateCompanionBuilder =
    CashSessionsTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required int userId,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<double> openingBalance,
      Value<double> totalSales,
      Value<double> totalReturns,
      Value<double> totalExpenses,
      required String status,
    });
typedef $$CashSessionsTableTableUpdateCompanionBuilder =
    CashSessionsTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<int> userId,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<double> openingBalance,
      Value<double> totalSales,
      Value<double> totalReturns,
      Value<double> totalExpenses,
      Value<String> status,
    });

class $$CashSessionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CashSessionsTableTable> {
  $$CashSessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalSales => $composableBuilder(
    column: $table.totalSales,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalReturns => $composableBuilder(
    column: $table.totalReturns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalExpenses => $composableBuilder(
    column: $table.totalExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CashSessionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CashSessionsTableTable> {
  $$CashSessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalSales => $composableBuilder(
    column: $table.totalSales,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalReturns => $composableBuilder(
    column: $table.totalReturns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalExpenses => $composableBuilder(
    column: $table.totalExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CashSessionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashSessionsTableTable> {
  $$CashSessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalSales => $composableBuilder(
    column: $table.totalSales,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalReturns => $composableBuilder(
    column: $table.totalReturns,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalExpenses => $composableBuilder(
    column: $table.totalExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$CashSessionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CashSessionsTableTable,
          CashSessionDbModel,
          $$CashSessionsTableTableFilterComposer,
          $$CashSessionsTableTableOrderingComposer,
          $$CashSessionsTableTableAnnotationComposer,
          $$CashSessionsTableTableCreateCompanionBuilder,
          $$CashSessionsTableTableUpdateCompanionBuilder,
          (
            CashSessionDbModel,
            BaseReferences<
              _$AppDatabase,
              $CashSessionsTableTable,
              CashSessionDbModel
            >,
          ),
          CashSessionDbModel,
          PrefetchHooks Function()
        > {
  $$CashSessionsTableTableTableManager(
    _$AppDatabase db,
    $CashSessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashSessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashSessionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashSessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<double> totalSales = const Value.absent(),
                Value<double> totalReturns = const Value.absent(),
                Value<double> totalExpenses = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => CashSessionsTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                userId: userId,
                startTime: startTime,
                endTime: endTime,
                openingBalance: openingBalance,
                totalSales: totalSales,
                totalReturns: totalReturns,
                totalExpenses: totalExpenses,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required int userId,
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<double> openingBalance = const Value.absent(),
                Value<double> totalSales = const Value.absent(),
                Value<double> totalReturns = const Value.absent(),
                Value<double> totalExpenses = const Value.absent(),
                required String status,
              }) => CashSessionsTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                userId: userId,
                startTime: startTime,
                endTime: endTime,
                openingBalance: openingBalance,
                totalSales: totalSales,
                totalReturns: totalReturns,
                totalExpenses: totalExpenses,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CashSessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CashSessionsTableTable,
      CashSessionDbModel,
      $$CashSessionsTableTableFilterComposer,
      $$CashSessionsTableTableOrderingComposer,
      $$CashSessionsTableTableAnnotationComposer,
      $$CashSessionsTableTableCreateCompanionBuilder,
      $$CashSessionsTableTableUpdateCompanionBuilder,
      (
        CashSessionDbModel,
        BaseReferences<
          _$AppDatabase,
          $CashSessionsTableTable,
          CashSessionDbModel
        >,
      ),
      CashSessionDbModel,
      PrefetchHooks Function()
    >;
typedef $$InvoicesTableTableCreateCompanionBuilder =
    InvoicesTableCompanion Function({
      required String id,
      required String pharmacyId,
      required String sessionId,
      required String userId,
      Value<String?> customerId,
      required double totalAmount,
      required double paidAmount,
      Value<double> discountTotal,
      required String paymentMethod,
      required String status,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$InvoicesTableTableUpdateCompanionBuilder =
    InvoicesTableCompanion Function({
      Value<String> id,
      Value<String> pharmacyId,
      Value<String> sessionId,
      Value<String> userId,
      Value<String?> customerId,
      Value<double> totalAmount,
      Value<double> paidAmount,
      Value<double> discountTotal,
      Value<String> paymentMethod,
      Value<String> status,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$InvoicesTableTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InvoicesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoicesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTableTable> {
  $$InvoicesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$InvoicesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTableTable,
          InvoiceDbModel,
          $$InvoicesTableTableFilterComposer,
          $$InvoicesTableTableOrderingComposer,
          $$InvoicesTableTableAnnotationComposer,
          $$InvoicesTableTableCreateCompanionBuilder,
          $$InvoicesTableTableUpdateCompanionBuilder,
          (
            InvoiceDbModel,
            BaseReferences<_$AppDatabase, $InvoicesTableTable, InvoiceDbModel>,
          ),
          InvoiceDbModel,
          PrefetchHooks Function()
        > {
  $$InvoicesTableTableTableManager(_$AppDatabase db, $InvoicesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pharmacyId = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> customerId = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<double> discountTotal = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                sessionId: sessionId,
                userId: userId,
                customerId: customerId,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                discountTotal: discountTotal,
                paymentMethod: paymentMethod,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pharmacyId,
                required String sessionId,
                required String userId,
                Value<String?> customerId = const Value.absent(),
                required double totalAmount,
                required double paidAmount,
                Value<double> discountTotal = const Value.absent(),
                required String paymentMethod,
                required String status,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                sessionId: sessionId,
                userId: userId,
                customerId: customerId,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                discountTotal: discountTotal,
                paymentMethod: paymentMethod,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InvoicesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTableTable,
      InvoiceDbModel,
      $$InvoicesTableTableFilterComposer,
      $$InvoicesTableTableOrderingComposer,
      $$InvoicesTableTableAnnotationComposer,
      $$InvoicesTableTableCreateCompanionBuilder,
      $$InvoicesTableTableUpdateCompanionBuilder,
      (
        InvoiceDbModel,
        BaseReferences<_$AppDatabase, $InvoicesTableTable, InvoiceDbModel>,
      ),
      InvoiceDbModel,
      PrefetchHooks Function()
    >;
typedef $$InvoiceItemsTableTableCreateCompanionBuilder =
    InvoiceItemsTableCompanion Function({
      required String id,
      required String invoiceId,
      required String productId,
      required String unitId,
      Value<String?> batchId,
      required double quantity,
      Value<double?> originalUnitPrice,
      Value<double> appliedDiscount,
      Value<double> appliedPremium,
      Value<double?> finalUnitPrice,
      Value<String?> priceModifiedBy,
      required double subtotal,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$InvoiceItemsTableTableUpdateCompanionBuilder =
    InvoiceItemsTableCompanion Function({
      Value<String> id,
      Value<String> invoiceId,
      Value<String> productId,
      Value<String> unitId,
      Value<String?> batchId,
      Value<double> quantity,
      Value<double?> originalUnitPrice,
      Value<double> appliedDiscount,
      Value<double> appliedPremium,
      Value<double?> finalUnitPrice,
      Value<String?> priceModifiedBy,
      Value<double> subtotal,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$InvoiceItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InvoiceItemsTableTable,
          InvoiceItemDbModel
        > {
  $$InvoiceItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductUnitsTableTable _unitIdTable(_$AppDatabase db) =>
      db.productUnitsTable.createAlias(
        $_aliasNameGenerator(
          db.invoiceItemsTable.unitId,
          db.productUnitsTable.id,
        ),
      );

  $$ProductUnitsTableTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<String>('unit_id')!;

    final manager = $$ProductUnitsTableTableTableManager(
      $_db,
      $_db.productUnitsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTableTable> {
  $$InvoiceItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get originalUnitPrice => $composableBuilder(
    column: $table.originalUnitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get appliedDiscount => $composableBuilder(
    column: $table.appliedDiscount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get appliedPremium => $composableBuilder(
    column: $table.appliedPremium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalUnitPrice => $composableBuilder(
    column: $table.finalUnitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priceModifiedBy => $composableBuilder(
    column: $table.priceModifiedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductUnitsTableTableFilterComposer get unitId {
    final $$ProductUnitsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.productUnitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductUnitsTableTableFilterComposer(
            $db: $db,
            $table: $db.productUnitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTableTable> {
  $$InvoiceItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get originalUnitPrice => $composableBuilder(
    column: $table.originalUnitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get appliedDiscount => $composableBuilder(
    column: $table.appliedDiscount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get appliedPremium => $composableBuilder(
    column: $table.appliedPremium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalUnitPrice => $composableBuilder(
    column: $table.finalUnitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priceModifiedBy => $composableBuilder(
    column: $table.priceModifiedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductUnitsTableTableOrderingComposer get unitId {
    final $$ProductUnitsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.productUnitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductUnitsTableTableOrderingComposer(
            $db: $db,
            $table: $db.productUnitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceItemsTableTable> {
  $$InvoiceItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get originalUnitPrice => $composableBuilder(
    column: $table.originalUnitPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get appliedDiscount => $composableBuilder(
    column: $table.appliedDiscount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get appliedPremium => $composableBuilder(
    column: $table.appliedPremium,
    builder: (column) => column,
  );

  GeneratedColumn<double> get finalUnitPrice => $composableBuilder(
    column: $table.finalUnitPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priceModifiedBy => $composableBuilder(
    column: $table.priceModifiedBy,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$ProductUnitsTableTableAnnotationComposer get unitId {
    final $$ProductUnitsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.unitId,
          referencedTable: $db.productUnitsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductUnitsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.productUnitsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InvoiceItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceItemsTableTable,
          InvoiceItemDbModel,
          $$InvoiceItemsTableTableFilterComposer,
          $$InvoiceItemsTableTableOrderingComposer,
          $$InvoiceItemsTableTableAnnotationComposer,
          $$InvoiceItemsTableTableCreateCompanionBuilder,
          $$InvoiceItemsTableTableUpdateCompanionBuilder,
          (InvoiceItemDbModel, $$InvoiceItemsTableTableReferences),
          InvoiceItemDbModel,
          PrefetchHooks Function({bool unitId})
        > {
  $$InvoiceItemsTableTableTableManager(
    _$AppDatabase db,
    $InvoiceItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double?> originalUnitPrice = const Value.absent(),
                Value<double> appliedDiscount = const Value.absent(),
                Value<double> appliedPremium = const Value.absent(),
                Value<double?> finalUnitPrice = const Value.absent(),
                Value<String?> priceModifiedBy = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoiceItemsTableCompanion(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                originalUnitPrice: originalUnitPrice,
                appliedDiscount: appliedDiscount,
                appliedPremium: appliedPremium,
                finalUnitPrice: finalUnitPrice,
                priceModifiedBy: priceModifiedBy,
                subtotal: subtotal,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String invoiceId,
                required String productId,
                required String unitId,
                Value<String?> batchId = const Value.absent(),
                required double quantity,
                Value<double?> originalUnitPrice = const Value.absent(),
                Value<double> appliedDiscount = const Value.absent(),
                Value<double> appliedPremium = const Value.absent(),
                Value<double?> finalUnitPrice = const Value.absent(),
                Value<String?> priceModifiedBy = const Value.absent(),
                required double subtotal,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoiceItemsTableCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                originalUnitPrice: originalUnitPrice,
                appliedDiscount: appliedDiscount,
                appliedPremium: appliedPremium,
                finalUnitPrice: finalUnitPrice,
                priceModifiedBy: priceModifiedBy,
                subtotal: subtotal,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unitId,
                                referencedTable:
                                    $$InvoiceItemsTableTableReferences
                                        ._unitIdTable(db),
                                referencedColumn:
                                    $$InvoiceItemsTableTableReferences
                                        ._unitIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceItemsTableTable,
      InvoiceItemDbModel,
      $$InvoiceItemsTableTableFilterComposer,
      $$InvoiceItemsTableTableOrderingComposer,
      $$InvoiceItemsTableTableAnnotationComposer,
      $$InvoiceItemsTableTableCreateCompanionBuilder,
      $$InvoiceItemsTableTableUpdateCompanionBuilder,
      (InvoiceItemDbModel, $$InvoiceItemsTableTableReferences),
      InvoiceItemDbModel,
      PrefetchHooks Function({bool unitId})
    >;
typedef $$ReturnsTableTableCreateCompanionBuilder =
    ReturnsTableCompanion Function({
      Value<int> id,
      required int pharmacyId,
      required int invoiceId,
      required int userId,
      required double totalRefund,
      Value<DateTime> returnDate,
    });
typedef $$ReturnsTableTableUpdateCompanionBuilder =
    ReturnsTableCompanion Function({
      Value<int> id,
      Value<int> pharmacyId,
      Value<int> invoiceId,
      Value<int> userId,
      Value<double> totalRefund,
      Value<DateTime> returnDate,
    });

class $$ReturnsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnsTableTable> {
  $$ReturnsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalRefund => $composableBuilder(
    column: $table.totalRefund,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get returnDate => $composableBuilder(
    column: $table.returnDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReturnsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnsTableTable> {
  $$ReturnsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalRefund => $composableBuilder(
    column: $table.totalRefund,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get returnDate => $composableBuilder(
    column: $table.returnDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReturnsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnsTableTable> {
  $$ReturnsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pharmacyId => $composableBuilder(
    column: $table.pharmacyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get totalRefund => $composableBuilder(
    column: $table.totalRefund,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get returnDate => $composableBuilder(
    column: $table.returnDate,
    builder: (column) => column,
  );
}

class $$ReturnsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReturnsTableTable,
          ReturnDbModel,
          $$ReturnsTableTableFilterComposer,
          $$ReturnsTableTableOrderingComposer,
          $$ReturnsTableTableAnnotationComposer,
          $$ReturnsTableTableCreateCompanionBuilder,
          $$ReturnsTableTableUpdateCompanionBuilder,
          (
            ReturnDbModel,
            BaseReferences<_$AppDatabase, $ReturnsTableTable, ReturnDbModel>,
          ),
          ReturnDbModel,
          PrefetchHooks Function()
        > {
  $$ReturnsTableTableTableManager(_$AppDatabase db, $ReturnsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pharmacyId = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<double> totalRefund = const Value.absent(),
                Value<DateTime> returnDate = const Value.absent(),
              }) => ReturnsTableCompanion(
                id: id,
                pharmacyId: pharmacyId,
                invoiceId: invoiceId,
                userId: userId,
                totalRefund: totalRefund,
                returnDate: returnDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pharmacyId,
                required int invoiceId,
                required int userId,
                required double totalRefund,
                Value<DateTime> returnDate = const Value.absent(),
              }) => ReturnsTableCompanion.insert(
                id: id,
                pharmacyId: pharmacyId,
                invoiceId: invoiceId,
                userId: userId,
                totalRefund: totalRefund,
                returnDate: returnDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReturnsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReturnsTableTable,
      ReturnDbModel,
      $$ReturnsTableTableFilterComposer,
      $$ReturnsTableTableOrderingComposer,
      $$ReturnsTableTableAnnotationComposer,
      $$ReturnsTableTableCreateCompanionBuilder,
      $$ReturnsTableTableUpdateCompanionBuilder,
      (
        ReturnDbModel,
        BaseReferences<_$AppDatabase, $ReturnsTableTable, ReturnDbModel>,
      ),
      ReturnDbModel,
      PrefetchHooks Function()
    >;
typedef $$ReturnItemsTableTableCreateCompanionBuilder =
    ReturnItemsTableCompanion Function({
      Value<int> id,
      required int returnId,
      required int invoiceItemId,
      required double quantity,
      required double refundAmount,
    });
typedef $$ReturnItemsTableTableUpdateCompanionBuilder =
    ReturnItemsTableCompanion Function({
      Value<int> id,
      Value<int> returnId,
      Value<int> invoiceItemId,
      Value<double> quantity,
      Value<double> refundAmount,
    });

class $$ReturnItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnItemsTableTable> {
  $$ReturnItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get returnId => $composableBuilder(
    column: $table.returnId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get invoiceItemId => $composableBuilder(
    column: $table.invoiceItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReturnItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnItemsTableTable> {
  $$ReturnItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get returnId => $composableBuilder(
    column: $table.returnId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get invoiceItemId => $composableBuilder(
    column: $table.invoiceItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReturnItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnItemsTableTable> {
  $$ReturnItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get returnId =>
      $composableBuilder(column: $table.returnId, builder: (column) => column);

  GeneratedColumn<int> get invoiceItemId => $composableBuilder(
    column: $table.invoiceItemId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => column,
  );
}

class $$ReturnItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReturnItemsTableTable,
          ReturnItemDbModel,
          $$ReturnItemsTableTableFilterComposer,
          $$ReturnItemsTableTableOrderingComposer,
          $$ReturnItemsTableTableAnnotationComposer,
          $$ReturnItemsTableTableCreateCompanionBuilder,
          $$ReturnItemsTableTableUpdateCompanionBuilder,
          (
            ReturnItemDbModel,
            BaseReferences<
              _$AppDatabase,
              $ReturnItemsTableTable,
              ReturnItemDbModel
            >,
          ),
          ReturnItemDbModel,
          PrefetchHooks Function()
        > {
  $$ReturnItemsTableTableTableManager(
    _$AppDatabase db,
    $ReturnItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> returnId = const Value.absent(),
                Value<int> invoiceItemId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> refundAmount = const Value.absent(),
              }) => ReturnItemsTableCompanion(
                id: id,
                returnId: returnId,
                invoiceItemId: invoiceItemId,
                quantity: quantity,
                refundAmount: refundAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int returnId,
                required int invoiceItemId,
                required double quantity,
                required double refundAmount,
              }) => ReturnItemsTableCompanion.insert(
                id: id,
                returnId: returnId,
                invoiceItemId: invoiceItemId,
                quantity: quantity,
                refundAmount: refundAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReturnItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReturnItemsTableTable,
      ReturnItemDbModel,
      $$ReturnItemsTableTableFilterComposer,
      $$ReturnItemsTableTableOrderingComposer,
      $$ReturnItemsTableTableAnnotationComposer,
      $$ReturnItemsTableTableCreateCompanionBuilder,
      $$ReturnItemsTableTableUpdateCompanionBuilder,
      (
        ReturnItemDbModel,
        BaseReferences<
          _$AppDatabase,
          $ReturnItemsTableTable,
          ReturnItemDbModel
        >,
      ),
      ReturnItemDbModel,
      PrefetchHooks Function()
    >;
typedef $$AuditLogsTableTableCreateCompanionBuilder =
    AuditLogsTableCompanion Function({
      Value<int> id,
      Value<int?> userId,
      required String action,
      required String targetTable,
      Value<String?> oldValue,
      Value<String?> newValue,
      Value<DateTime> createdAt,
    });
typedef $$AuditLogsTableTableUpdateCompanionBuilder =
    AuditLogsTableCompanion Function({
      Value<int> id,
      Value<int?> userId,
      Value<String> action,
      Value<String> targetTable,
      Value<String?> oldValue,
      Value<String?> newValue,
      Value<DateTime> createdAt,
    });

class $$AuditLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTableTable> {
  $$AuditLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oldValue => $composableBuilder(
    column: $table.oldValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newValue => $composableBuilder(
    column: $table.newValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTableTable> {
  $$AuditLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldValue => $composableBuilder(
    column: $table.oldValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newValue => $composableBuilder(
    column: $table.newValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTableTable> {
  $$AuditLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oldValue =>
      $composableBuilder(column: $table.oldValue, builder: (column) => column);

  GeneratedColumn<String> get newValue =>
      $composableBuilder(column: $table.newValue, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuditLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTableTable,
          AuditLogDbModel,
          $$AuditLogsTableTableFilterComposer,
          $$AuditLogsTableTableOrderingComposer,
          $$AuditLogsTableTableAnnotationComposer,
          $$AuditLogsTableTableCreateCompanionBuilder,
          $$AuditLogsTableTableUpdateCompanionBuilder,
          (
            AuditLogDbModel,
            BaseReferences<
              _$AppDatabase,
              $AuditLogsTableTable,
              AuditLogDbModel
            >,
          ),
          AuditLogDbModel,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableTableManager(
    _$AppDatabase db,
    $AuditLogsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> targetTable = const Value.absent(),
                Value<String?> oldValue = const Value.absent(),
                Value<String?> newValue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsTableCompanion(
                id: id,
                userId: userId,
                action: action,
                targetTable: targetTable,
                oldValue: oldValue,
                newValue: newValue,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                required String action,
                required String targetTable,
                Value<String?> oldValue = const Value.absent(),
                Value<String?> newValue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsTableCompanion.insert(
                id: id,
                userId: userId,
                action: action,
                targetTable: targetTable,
                oldValue: oldValue,
                newValue: newValue,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTableTable,
      AuditLogDbModel,
      $$AuditLogsTableTableFilterComposer,
      $$AuditLogsTableTableOrderingComposer,
      $$AuditLogsTableTableAnnotationComposer,
      $$AuditLogsTableTableCreateCompanionBuilder,
      $$AuditLogsTableTableUpdateCompanionBuilder,
      (
        AuditLogDbModel,
        BaseReferences<_$AppDatabase, $AuditLogsTableTable, AuditLogDbModel>,
      ),
      AuditLogDbModel,
      PrefetchHooks Function()
    >;
typedef $$PaymentsTableTableCreateCompanionBuilder =
    PaymentsTableCompanion Function({
      Value<int> id,
      Value<int?> invoiceId,
      Value<int?> customerId,
      required double amount,
      required String method,
      Value<DateTime> createdAt,
    });
typedef $$PaymentsTableTableUpdateCompanionBuilder =
    PaymentsTableCompanion Function({
      Value<int> id,
      Value<int?> invoiceId,
      Value<int?> customerId,
      Value<double> amount,
      Value<String> method,
      Value<DateTime> createdAt,
    });

class $$PaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTableTable> {
  $$PaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTableTable> {
  $$PaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTableTable> {
  $$PaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PaymentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTableTable,
          PaymentDbModel,
          $$PaymentsTableTableFilterComposer,
          $$PaymentsTableTableOrderingComposer,
          $$PaymentsTableTableAnnotationComposer,
          $$PaymentsTableTableCreateCompanionBuilder,
          $$PaymentsTableTableUpdateCompanionBuilder,
          (
            PaymentDbModel,
            BaseReferences<_$AppDatabase, $PaymentsTableTable, PaymentDbModel>,
          ),
          PaymentDbModel,
          PrefetchHooks Function()
        > {
  $$PaymentsTableTableTableManager(_$AppDatabase db, $PaymentsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> invoiceId = const Value.absent(),
                Value<int?> customerId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsTableCompanion(
                id: id,
                invoiceId: invoiceId,
                customerId: customerId,
                amount: amount,
                method: method,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> invoiceId = const Value.absent(),
                Value<int?> customerId = const Value.absent(),
                required double amount,
                required String method,
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsTableCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                customerId: customerId,
                amount: amount,
                method: method,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTableTable,
      PaymentDbModel,
      $$PaymentsTableTableFilterComposer,
      $$PaymentsTableTableOrderingComposer,
      $$PaymentsTableTableAnnotationComposer,
      $$PaymentsTableTableCreateCompanionBuilder,
      $$PaymentsTableTableUpdateCompanionBuilder,
      (
        PaymentDbModel,
        BaseReferences<_$AppDatabase, $PaymentsTableTable, PaymentDbModel>,
      ),
      PaymentDbModel,
      PrefetchHooks Function()
    >;
typedef $$MasterDrugsTableTableCreateCompanionBuilder =
    MasterDrugsTableCompanion Function({
      required String id,
      required String name,
      Value<String?> barcode,
      Value<String?> category,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$MasterDrugsTableTableUpdateCompanionBuilder =
    MasterDrugsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> barcode,
      Value<String?> category,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$MasterDrugsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MasterDrugsTableTable,
          MasterDrugsTableData
        > {
  $$MasterDrugsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MasterUnitsTableTable, List<MasterUnitsTableData>>
  _masterUnitsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.masterUnitsTable,
    aliasName: $_aliasNameGenerator(
      db.masterDrugsTable.id,
      db.masterUnitsTable.masterDrugId,
    ),
  );

  $$MasterUnitsTableTableProcessedTableManager get masterUnitsTableRefs {
    final manager = $$MasterUnitsTableTableTableManager(
      $_db,
      $_db.masterUnitsTable,
    ).filter((f) => f.masterDrugId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _masterUnitsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MasterDrugsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MasterDrugsTableTable> {
  $$MasterDrugsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> masterUnitsTableRefs(
    Expression<bool> Function($$MasterUnitsTableTableFilterComposer f) f,
  ) {
    final $$MasterUnitsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masterUnitsTable,
      getReferencedColumn: (t) => t.masterDrugId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasterUnitsTableTableFilterComposer(
            $db: $db,
            $table: $db.masterUnitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MasterDrugsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MasterDrugsTableTable> {
  $$MasterDrugsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MasterDrugsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasterDrugsTableTable> {
  $$MasterDrugsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> masterUnitsTableRefs<T extends Object>(
    Expression<T> Function($$MasterUnitsTableTableAnnotationComposer a) f,
  ) {
    final $$MasterUnitsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.masterUnitsTable,
      getReferencedColumn: (t) => t.masterDrugId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasterUnitsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.masterUnitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MasterDrugsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MasterDrugsTableTable,
          MasterDrugsTableData,
          $$MasterDrugsTableTableFilterComposer,
          $$MasterDrugsTableTableOrderingComposer,
          $$MasterDrugsTableTableAnnotationComposer,
          $$MasterDrugsTableTableCreateCompanionBuilder,
          $$MasterDrugsTableTableUpdateCompanionBuilder,
          (MasterDrugsTableData, $$MasterDrugsTableTableReferences),
          MasterDrugsTableData,
          PrefetchHooks Function({bool masterUnitsTableRefs})
        > {
  $$MasterDrugsTableTableTableManager(
    _$AppDatabase db,
    $MasterDrugsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasterDrugsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasterDrugsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasterDrugsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MasterDrugsTableCompanion(
                id: id,
                name: name,
                barcode: barcode,
                category: category,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> barcode = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MasterDrugsTableCompanion.insert(
                id: id,
                name: name,
                barcode: barcode,
                category: category,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MasterDrugsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({masterUnitsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (masterUnitsTableRefs) db.masterUnitsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (masterUnitsTableRefs)
                    await $_getPrefetchedData<
                      MasterDrugsTableData,
                      $MasterDrugsTableTable,
                      MasterUnitsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$MasterDrugsTableTableReferences
                          ._masterUnitsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MasterDrugsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).masterUnitsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.masterDrugId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MasterDrugsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MasterDrugsTableTable,
      MasterDrugsTableData,
      $$MasterDrugsTableTableFilterComposer,
      $$MasterDrugsTableTableOrderingComposer,
      $$MasterDrugsTableTableAnnotationComposer,
      $$MasterDrugsTableTableCreateCompanionBuilder,
      $$MasterDrugsTableTableUpdateCompanionBuilder,
      (MasterDrugsTableData, $$MasterDrugsTableTableReferences),
      MasterDrugsTableData,
      PrefetchHooks Function({bool masterUnitsTableRefs})
    >;
typedef $$MasterUnitsTableTableCreateCompanionBuilder =
    MasterUnitsTableCompanion Function({
      required String id,
      required String masterDrugId,
      required String unitName,
      required double conversionFactor,
      Value<int> rowid,
    });
typedef $$MasterUnitsTableTableUpdateCompanionBuilder =
    MasterUnitsTableCompanion Function({
      Value<String> id,
      Value<String> masterDrugId,
      Value<String> unitName,
      Value<double> conversionFactor,
      Value<int> rowid,
    });

final class $$MasterUnitsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MasterUnitsTableTable,
          MasterUnitsTableData
        > {
  $$MasterUnitsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MasterDrugsTableTable _masterDrugIdTable(_$AppDatabase db) =>
      db.masterDrugsTable.createAlias(
        $_aliasNameGenerator(
          db.masterUnitsTable.masterDrugId,
          db.masterDrugsTable.id,
        ),
      );

  $$MasterDrugsTableTableProcessedTableManager get masterDrugId {
    final $_column = $_itemColumn<String>('master_drug_id')!;

    final manager = $$MasterDrugsTableTableTableManager(
      $_db,
      $_db.masterDrugsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_masterDrugIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MasterUnitsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MasterUnitsTableTable> {
  $$MasterUnitsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => ColumnFilters(column),
  );

  $$MasterDrugsTableTableFilterComposer get masterDrugId {
    final $$MasterDrugsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.masterDrugId,
      referencedTable: $db.masterDrugsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasterDrugsTableTableFilterComposer(
            $db: $db,
            $table: $db.masterDrugsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasterUnitsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MasterUnitsTableTable> {
  $$MasterUnitsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => ColumnOrderings(column),
  );

  $$MasterDrugsTableTableOrderingComposer get masterDrugId {
    final $$MasterDrugsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.masterDrugId,
      referencedTable: $db.masterDrugsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasterDrugsTableTableOrderingComposer(
            $db: $db,
            $table: $db.masterDrugsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasterUnitsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MasterUnitsTableTable> {
  $$MasterUnitsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<double> get conversionFactor => $composableBuilder(
    column: $table.conversionFactor,
    builder: (column) => column,
  );

  $$MasterDrugsTableTableAnnotationComposer get masterDrugId {
    final $$MasterDrugsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.masterDrugId,
      referencedTable: $db.masterDrugsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MasterDrugsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.masterDrugsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MasterUnitsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MasterUnitsTableTable,
          MasterUnitsTableData,
          $$MasterUnitsTableTableFilterComposer,
          $$MasterUnitsTableTableOrderingComposer,
          $$MasterUnitsTableTableAnnotationComposer,
          $$MasterUnitsTableTableCreateCompanionBuilder,
          $$MasterUnitsTableTableUpdateCompanionBuilder,
          (MasterUnitsTableData, $$MasterUnitsTableTableReferences),
          MasterUnitsTableData,
          PrefetchHooks Function({bool masterDrugId})
        > {
  $$MasterUnitsTableTableTableManager(
    _$AppDatabase db,
    $MasterUnitsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MasterUnitsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MasterUnitsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MasterUnitsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> masterDrugId = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<double> conversionFactor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MasterUnitsTableCompanion(
                id: id,
                masterDrugId: masterDrugId,
                unitName: unitName,
                conversionFactor: conversionFactor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String masterDrugId,
                required String unitName,
                required double conversionFactor,
                Value<int> rowid = const Value.absent(),
              }) => MasterUnitsTableCompanion.insert(
                id: id,
                masterDrugId: masterDrugId,
                unitName: unitName,
                conversionFactor: conversionFactor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MasterUnitsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({masterDrugId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (masterDrugId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.masterDrugId,
                                referencedTable:
                                    $$MasterUnitsTableTableReferences
                                        ._masterDrugIdTable(db),
                                referencedColumn:
                                    $$MasterUnitsTableTableReferences
                                        ._masterDrugIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MasterUnitsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MasterUnitsTableTable,
      MasterUnitsTableData,
      $$MasterUnitsTableTableFilterComposer,
      $$MasterUnitsTableTableOrderingComposer,
      $$MasterUnitsTableTableAnnotationComposer,
      $$MasterUnitsTableTableCreateCompanionBuilder,
      $$MasterUnitsTableTableUpdateCompanionBuilder,
      (MasterUnitsTableData, $$MasterUnitsTableTableReferences),
      MasterUnitsTableData,
      PrefetchHooks Function({bool masterDrugId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PharmaciesTableTableTableManager get pharmaciesTable =>
      $$PharmaciesTableTableTableManager(_db, _db.pharmaciesTable);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$CustomersTableTableTableManager get customersTable =>
      $$CustomersTableTableTableManager(_db, _db.customersTable);
  $$CategoriesTableTableTableManager get categoriesTable =>
      $$CategoriesTableTableTableManager(_db, _db.categoriesTable);
  $$ManufacturersTableTableTableManager get manufacturersTable =>
      $$ManufacturersTableTableTableManager(_db, _db.manufacturersTable);
  $$SuppliersTableTableTableManager get suppliersTable =>
      $$SuppliersTableTableTableManager(_db, _db.suppliersTable);
  $$SupplierPaymentsTableTableTableManager get supplierPaymentsTable =>
      $$SupplierPaymentsTableTableTableManager(_db, _db.supplierPaymentsTable);
  $$PurchaseInvoicesTableTableTableManager get purchaseInvoicesTable =>
      $$PurchaseInvoicesTableTableTableManager(_db, _db.purchaseInvoicesTable);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$ProductUnitsTableTableTableManager get productUnitsTable =>
      $$ProductUnitsTableTableTableManager(_db, _db.productUnitsTable);
  $$ProductBatchesTableTableTableManager get productBatchesTable =>
      $$ProductBatchesTableTableTableManager(_db, _db.productBatchesTable);
  $$CashSessionsTableTableTableManager get cashSessionsTable =>
      $$CashSessionsTableTableTableManager(_db, _db.cashSessionsTable);
  $$InvoicesTableTableTableManager get invoicesTable =>
      $$InvoicesTableTableTableManager(_db, _db.invoicesTable);
  $$InvoiceItemsTableTableTableManager get invoiceItemsTable =>
      $$InvoiceItemsTableTableTableManager(_db, _db.invoiceItemsTable);
  $$ReturnsTableTableTableManager get returnsTable =>
      $$ReturnsTableTableTableManager(_db, _db.returnsTable);
  $$ReturnItemsTableTableTableManager get returnItemsTable =>
      $$ReturnItemsTableTableTableManager(_db, _db.returnItemsTable);
  $$AuditLogsTableTableTableManager get auditLogsTable =>
      $$AuditLogsTableTableTableManager(_db, _db.auditLogsTable);
  $$PaymentsTableTableTableManager get paymentsTable =>
      $$PaymentsTableTableTableManager(_db, _db.paymentsTable);
  $$MasterDrugsTableTableTableManager get masterDrugsTable =>
      $$MasterDrugsTableTableTableManager(_db, _db.masterDrugsTable);
  $$MasterUnitsTableTableTableManager get masterUnitsTable =>
      $$MasterUnitsTableTableTableManager(_db, _db.masterUnitsTable);
}
