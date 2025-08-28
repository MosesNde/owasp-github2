     ReportType GetByGuid<ReportType>(Guid guid) where ReportType : Report;
     Report UpdateReport(Report newReport, Guid responderId);
     void DeleteReport(Guid guid);
}
\ No newline at end of file