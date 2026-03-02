import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/task.dart';

class PdfService {
  static Future<void> exportTasks({
    required List<Task> tasks,
    required DateTime date,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Planner — ${date.toLocal().toString().split(' ')[0]}',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),

              if (tasks.isEmpty) pw.Text('No tasks for this day ✨'),

              ...tasks.map(
                (task) => pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 8),
                  child: pw.Row(
                    children: [
                      pw.Text(
                        task.completed ? '✓' : '○',
                        style: pw.TextStyle(fontSize: 14),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Text(
                        task.title,
                        style: pw.TextStyle(
                          fontSize: 14,
                          decoration: task.completed
                              ? pw.TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
