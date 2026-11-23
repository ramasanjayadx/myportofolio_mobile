import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String _role = "";
  String _organization = "";
  String _experienceType = "Magang";
  DateTime? _startDate;
  DateTime? _endDate;
  String _description = "";

  final List<String> _experienceTypes = [
    'Magang',
    'Penuh Waktu',
    'Paruh Waktu',
    'Organisasi',
    'Kepanitiaan',
    'Lainnya',
  ];

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  Future<void> _selectDate({required bool isStartDate}) async {
    final initial = isStartDate
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          _startDateController.text = _formatDate(picked);
        } else {
          _endDate = picked;
          _endDateController.text = _formatDate(picked);
        }
      });
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _startDateController.clear();
    _endDateController.clear();
    setState(() {
      _role = "";
      _organization = "";
      _experienceType = "Magang";
      _startDate = null;
      _endDate = null;
      _description = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Experience Form',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Posisi / Peran
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Posisi / Peran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _role = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    final trimmed = value?.trim() ?? "";
                    if (trimmed.isEmpty) {
                      return "Posisi / peran tidak boleh kosong!";
                    }
                    if (trimmed.length < 2) {
                      return "Posisi / peran minimal 2 karakter!";
                    }
                    if (trimmed.length > 100) {
                      return "Posisi / peran maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Perusahaan / Organisasi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: PT Teknologi Nusantara / BEM Fasilkom",
                    labelText: "Perusahaan / Organisasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _organization = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    final trimmed = value?.trim() ?? "";
                    if (trimmed.isEmpty) {
                      return "Perusahaan / organisasi tidak boleh kosong!";
                    }
                    if (trimmed.length > 100) {
                      return "Perusahaan / organisasi maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Tipe Pengalaman
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Tipe Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _experienceType,
                  items: _experienceTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _experienceType = newValue;
                      });
                    }
                  },
                ),
              ),

              // Tanggal Mulai
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal mulai",
                    labelText: "Tanggal Mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () => _selectDate(isStartDate: true),
                  validator: (String? value) {
                    if (_startDate == null || (value?.trim().isEmpty ?? true)) {
                      return "Tanggal mulai wajib dipilih!";
                    }
                    return null;
                  },
                ),
              ),

              // Tanggal Selesai
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal selesai (opsional)",
                    labelText: "Tanggal Selesai",
                    suffixIcon: _endDate != null
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _endDate = null;
                                _endDateController.clear();
                              });
                            },
                          )
                        : const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () => _selectDate(isStartDate: false),
                  validator: (String? value) {
                    if (_startDate != null &&
                        _endDate != null &&
                        _endDate!.isBefore(_startDate!)) {
                      return "Tanggal selesai tidak boleh lebih awal dari tanggal mulai!";
                    }
                    return null;
                  },
                ),
              ),

              // Deskripsi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Ceritakan tanggung jawab dan pencapaianmu",
                    labelText: "Deskripsi Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    final trimmed = value?.trim() ?? "";
                    if (trimmed.isEmpty) {
                      return "Deskripsi pengalaman tidak boleh kosong!";
                    }
                    if (trimmed.length > 500) {
                      return "Deskripsi pengalaman maksimal 500 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Tombol Simpan
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final endDateText = _endDate != null
                            ? _formatDate(_endDate!)
                            : "Sekarang";
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Pengalaman berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Posisi / Peran: ${_role.trim()}'),
                                    Text(
                                      'Perusahaan / Organisasi: ${_organization.trim()}',
                                    ),
                                    Text('Tipe: $_experienceType'),
                                    Text(
                                      'Tanggal Mulai: ${_formatDate(_startDate!)}',
                                    ),
                                    Text('Tanggal Selesai: $endDateText'),
                                    Text('Deskripsi: ${_description.trim()}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _resetForm();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
